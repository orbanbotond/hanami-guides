require 'dry/monads/result'

module Macros
  def self.FK_Check(fk_key:, repository:)
    step = ->(operation, options) do
      params = options["params"]

      if repository.new.find params.fetch(fk_key)
        options["result.fk_reference.default"] = Dry::Monads.Success
      else
        options["result.fk_reference.default"] = Dry::Monads.Failure("The referenced model with the foreign key: #{fk_key} doesn't exists")
        options["result.fk_reference.key"] = fk_key
      end

      options["result.fk_reference.default"].success?
    end

    [ step, name: "FK_Checker.#{fk_key}" ]
  end
end