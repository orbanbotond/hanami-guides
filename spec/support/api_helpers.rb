# frozen_string_literal: true

module APIHelpers

  def self.included(base)
    base.class_eval do
      after(:each) do
      end
    end
  end
end
