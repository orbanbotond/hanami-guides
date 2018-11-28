module Api
  module Controllers
    module Stories
      class Create
        include Api::Action

        accept :json

        REFFERENCE_ERROR_MESSAGE = "Reference doesn't exists"

        params Class.new(Hanami::Action::Params) {
          predicate(:reference_exists?, message: REFFERENCE_ERROR_MESSAGE) do |current|
            UserRepository.new.find(current)
          end

          validations do
            required(:text).filled(:str?)
            required(:user_id) { int? & reference_exists?}
          end
        }

        def call(params)
          self.format =  :json

          if params.valid?
            story = StoryRepository.new.create params

            self.status = 201
            self.body = JSON.generate(story.to_h)
          else
            if (pair = params.errors.select{|k,v| v.first =~ /#{REFFERENCE_ERROR_MESSAGE}/}).empty?
              self.status = 400
              self.body = {error: 'Wrong Input'}.to_json
            else
              self.status = 404
              self.body = {error: pair.keys.first}.to_json
            end
          end
        end
      end
    end
  end
end
