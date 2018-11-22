class BookRepository < Hanami::Repository
  associations do
    belongs_to :author
  end
end
