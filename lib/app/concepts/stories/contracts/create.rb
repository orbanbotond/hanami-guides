# frozen_string_literal: true

require "reform/form/dry"

module Stories
  module Contracts
    class Create < Reform::Form
      feature Reform::Form::Dry

      property :text
      property :user_id

      validation :default do
        required(:text).filled(:str?)
        required(:user_id).filled(:int?)
      end
    end
  end
end
