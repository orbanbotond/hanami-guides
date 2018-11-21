namespace :export do

  desc 'Dry the Books by exctracting the Author'
  task clear_books: :environment do
    bookRepo = BookRepository.new

    bookRepo.all.each do |book|
      puts "Processing:#{book.author}"
      author = AuthorRepository.new.create({name: book.author})
      puts "Id:#{author.id}"
      bookRepo.update(book.id, {author_id: author.id})
    end
  end
end