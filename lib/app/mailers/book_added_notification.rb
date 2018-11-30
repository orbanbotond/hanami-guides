module Mailers
  class BookAddedNotification
    include Hanami::Mailer

    from    "no-reply@example.com"
    to      "admin@example.com"
    subject :subject

    def greeting
      "Ahhoy: #{name}"
    end

    private
      def subject
        "Book added! '#{name}'"
      end
  end
end
