class StoryRepository < Hanami::Repository
  associations do
    belongs_to :user, as: :author
    has_many :comments
    has_many :users, through: :comments, as: :commenters
  end

  def find_with_comments(id)
    aggregate(:author, comments: :commenter).where(id: id).map_to(Story).one
  end

  def find_with_commenters(id)
    aggregate(:users).where(id: id).map_to(Story).one
  end
end