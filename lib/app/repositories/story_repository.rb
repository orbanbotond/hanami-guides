class StoryRepository < Hanami::Repository
  associations do
    belongs_to :user, as: :author
    has_many :comments
    has_many :users, through: :comments
    # has_many :users, through: :comments, as: :commenters
  end

  def find_with_comments(id)
    aggregate(:author, comments: :commenter).where(id: id).map_to(Story).one
  end

  # def find_with_commenters(id)
  #   aggregate(:users).where(id: id).map_to(Story).one
  # end

  def joined_with_comments()
    # it makes only sense with where...
    stories
      .join(comments)
      .as(Story).to_a
  end

  def with_comments()
    aggregate(:comments).map_to(Story).to_a
  end
end