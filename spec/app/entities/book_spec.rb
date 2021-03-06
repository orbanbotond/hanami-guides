RSpec.describe Book, type: :entity do
  let(:instance) { described_class.new }

  [:title, :author_id].each do |field|
    specify "##{field}" do
       expect(instance).to respond_to(field)
    end
  end
end
