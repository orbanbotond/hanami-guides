class UserRepository < Hanami::Repository
  associations do
    has_many :stories
    has_many :comments
  end
end
