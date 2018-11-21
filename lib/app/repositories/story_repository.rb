class StoryRepository < Hanami::Repository
  associations do
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
  end

  def find_with_comments(id)
    # aggregate(:user, comments: :user).where(id: id).map_to(Story).one
    aggregate(:comments).where(id: id).map_to(Story).one
  end

end
