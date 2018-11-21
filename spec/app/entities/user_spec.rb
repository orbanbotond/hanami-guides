RSpec.describe User, type: :entity do
  let(:instance) { described_class.new }

  context 'fields' do
    [:name].each do |field|
      specify "##{field}" do
         expect(instance).to respond_to(field)
      end
    end
  end
end
