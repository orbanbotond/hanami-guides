# frozen_string_literal: true

require_relative '../../../entities/story'
require_relative '../../../repositories/user_repository'
require_relative '../../macros'

module Stories
  module Operations
    class Create < Trailblazer::Operation
      step Model(::Story, :new)
      step Contract::Build(constant: Stories::Contracts::Create)
      step Contract::Validate()
      step Macros::FK_Check( fk_key: :user_id, repository: ::UserRepository )
      step :persist

      def persist(options, params:, **)
        options['result.model'] = StoryRepository.new.create(params)
      end
    end
  end
end
