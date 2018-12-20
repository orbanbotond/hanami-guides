module Mailers
  class BookAddedNotification
    include Hanami::Mailer
    layout "custom_layoutt"

    from    "no-reply@example.com"
    to      "admin@example.com"
    subject :subject

    def greeting
      "Ahhoy: #{name}"
    end

    def prepare
      mail.attachments['invoice.pdf'] = File.read File.join(Hanami.root, "public", "optigrill.pdf")

      html_part = mail.html_part
      old_html = html_part.body.decoded

      document = Roadie::Document.new old_html
      document.add_css File.read( File.join(Hanami.root, "lib", "app", "mailers", "assets", "stylesheets", "mail.css"))
      new_html = document.transform

      html_part.body = new_html
    end

    private
      def subject
        "Book added! '#{name}'"
      end
  end
end
