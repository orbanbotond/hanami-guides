require_relative '../../../../apps/web/controllers/books/create'

RSpec.describe Web::Controllers::Books::Create do
  let(:interactor) { instance_double('AddBook', call: nil) }
  let(:action) { Web::Controllers::Books::Create.new interactor: interactor}

  context 'with valid params' do
    let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

    it 'calls interactor' do
      expect(interactor).to receive(:call)
      response = action.call(params)
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it 'calls interactor' do
      expect(interactor).to_not receive(:call)
      response = action.call(params)
    end

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq(['is missing'])
      expect(errors.dig(:book, :author)).to eq(['is missing'])
    end
  end
end