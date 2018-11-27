module Api
  module Controllers
    module Stories
      class Create
        include Api::Action

        accept :json

        params do
          def existing?(value)
            return false unless UserRepository.find(value)

            true
          end

          required(:text).filled(:str?)
          required(:user_id).filled(:int?)
        end

        def call(params)
          self.format =  :json

          if params.valid?
            story = StoryRepository.new.create params

            self.status = 201
            self.body = JSON.generate(story.to_h)
          else
            self.status = 400
            self.body = {error: 'Wrong Input'}.to_json
          end
        end
      end
    end
  end
end
