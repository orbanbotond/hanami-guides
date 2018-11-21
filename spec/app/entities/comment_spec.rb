RSpec.describe Comment, type: :entity do
  let(:instance) { described_class.new }

  [:user_id, :story_id, :text].each do |field|
    specify "##{field}" do
       expect(instance).to respond_to(field)
    end
  end
end
