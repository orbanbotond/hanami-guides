RSpec.describe Mailers::Welcome, type: :mailer do
  it 'delivers email' do
    mail = Mailers::Welcome.deliver
  end
end
