module Api
  module Controllers
    module Stories
      class Create
        include Api::Action

        accept :json

        API_KEY = "Api-Key"

        def call(params)
          self.format =  :json
          puts "API key: #{params.env[API_KEY]}"

          result = ::Stories::Operations::Create.(params.to_h, {})
          action = self

          additional_outcomes = {
            reference_not_found: Dry::Matcher::Case.new(
              match:   ->(result) { result.failure? && result["result.fk_reference.default"] && result["result.fk_reference.default"].failure? },
              resolve: ->(result) { result })
          }

          Trailblazer::Endpoint.new.(result, 
                                      outcomes: [:success, :invalid],
                                      additional_outcomes: additional_outcomes
                                      ) do |outcome|
            outcome.reference_not_found do |result|
              self.status = 404
              self.body = JSON.generate("Reference to the key: #{result['result.fk_reference.key']} not found!")
            end
            outcome.success do |result|
              self.status = 201
              self.body = JSON.generate(result["result.model"].to_h)
            end
            outcome.invalid do |result|
              self.status = 400
              self.body = {error: 'Wrong Input'}.to_json
            end
          end
        end
      end
    end
  end
end
