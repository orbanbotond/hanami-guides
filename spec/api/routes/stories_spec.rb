RSpec.describe Api.routes do
  context 'Generates' do
    it 'generates "/api/stories/23"' do
      actual = described_class.path(:story, id: 23)
      expect(actual).to eq('/api/stories/23')
    end   
  end
end