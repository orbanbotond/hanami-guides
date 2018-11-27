module Api
  module Controllers
    module Stories
      class Create
        include Api::Action

        def call(params)
          self.status = 201
          self.body = {}.to_json
        end
      end
    end
  end
end
