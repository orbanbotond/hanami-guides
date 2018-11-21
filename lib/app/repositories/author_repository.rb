class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def create_with_books(data)
    assoc(:books).create(data)
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).map_to(Author).one
  end

  def add_book(author, data)
    assoc(:books, author).add(data)
  end

  # def remove_book(author, id)
  #   assoc(:books, author).remove(id)
  # end
end
