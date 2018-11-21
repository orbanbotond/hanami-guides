RSpec.describe Author, type: :entity do
  let(:instance) { described_class.new }

  [:name].each do |field|
    specify "##{field}" do
       expect(instance).to respond_to(field)
    end
  end
end
