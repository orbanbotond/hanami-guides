# frozen_string_literal: true

module Stories
  module Operations
    class Create < Trailblazer::Operation
      step Model(::Story, :new)
      # step Contract::Build(constant: Stories::Contracts::Create)
      # step Contract::Validate()
      # step :persist

      # def persist(options, params:, **)
      #   option['model'] = StoryRepository.new.create(params)
      # end
    end
  end
end
