module Mailers
  class BookAddedNotification
    include Hanami::Mailer

    from    "no-reply@example.com"
    to      "admin@example.com"
    subject :subject

    def body
      "sex"
    end

    def greeting
      "Ahhoy: #{name}"
    end

    def prepare
      mail.attachments['invoice.pdf'] = File.read File.join(Hanami.root, "public", "optigrill.pdf")

    end

    private
      def subject
        "Book added! '#{name}'"
      end
  end
end
