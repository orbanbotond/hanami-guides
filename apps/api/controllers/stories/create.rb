module Api
  module Controllers
    module Stories
      class Create
        include Api::Action

        accept :json

        params Class.new(Hanami::Action::Params) {
          predicate(:exists?, message: "User doesn't exists") do |current|
            UserRepository.new.find(current)
          end

          validations do
            required(:text).filled(:str?)
            required(:user_id) { int? & exists?}
          end
        }

        # params do
        #   required(:text).filled(:str?)
        #   required(:user_id).filled(:int?)
        # end

        def call(params)
          self.format =  :json

          if params.valid?
            story = StoryRepository.new.create params

            self.status = 201
            self.body = JSON.generate(story.to_h)
          else
          if params.errors.include?(:user_id) && params.errors[:user_id] == ["User doesn't exists"]
              self.status = 404
              self.body = {error: 'The reference does not exists'}.to_json
            else
              self.status = 400
              self.body = {error: 'Wrong Input'}.to_json
            end
          end
        end
      end
    end
  end
end
