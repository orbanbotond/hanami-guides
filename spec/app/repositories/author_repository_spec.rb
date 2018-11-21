RSpec.describe AuthorRepository, type: :repository do
  let(:repo) { described_class.new }

  context '#find' do
    let!(:author) { repo.create(name: 'Boti') }

    specify 'The record' do
      expect(repo.find(author.id)).to_not be_nil
    end
  end

  context '#create_with_books' do
    let(:params) { { name: "Alexandre Dumas", books: [{title: "The Count of Montecristo"}] } }

    specify 'The books will be created' do
      author = repo.create_with_books(params)

      expect(author.id).to_not be_nil
      expect(author.books).to_not be_nil
    end
  end

  context '#find_with_books' do
    let(:params) { {name: "Alexandre Dumas", books: [{title: "The Count of Montecristo"}]} }

    specify 'The books will be created' do
      author = repo.create_with_books(params)

      author = repo.find_with_books(author.id)
      expect(author.books).to_not be_nil
    end
  end

  context '#add_book' do
    let!(:author) { repo.create(name: 'Boti') }
    let(:params) { {title: "The Count of Montecristo"} }

    specify 'The book will be added' do
      book = repo.add_book(author, params)

      expect(book.title).to_not be_nil
    end
  end

  # context '#remove_book' do
  #   let(:params) { { name: "Alexandre Dumas", books: [{title: "The Count of Montecristo"}] } }
  #   let!(:author) { repo.create_with_books(params) }

  #   specify 'The book will be removed' do
  #     puts author.books
  #     puts author.books.first.id

  #     # repo.remove_book(author, author.books.first.id)
  #     # expect(repo.find_with_books(author.id).books).to be_nil
  #   end
  # end
end
