class StoryRepository < Hanami::Repository
  associations do
    belongs_to :user, as: :author
    has_many :comments
    has_many :users, through: :comments, as: :commenters
    # has_many :users, through: :comments
  end

  def find_with_comments(id)
    aggregate(:author, comments: :user).where(id: id).map_to(Story).one
    # aggregate(:author, comments: :commenter).where(id: id).map_to(Story).one
  end

  def find_with_commenters(id)
    aggregate(:commenters).where(id: id).map_to(Story).one
  end

  def commenters_for(post)
    assoc(:commenters, post).to_a
  end

  def with_comments
    aggregate(:comments).map_to(Story).to_a
  end

  def with_comments_at(date_range)
    aggregate(:comments)
    .join(comments)
    .where(comments[:created_at].qualified => date_range)
    .group(:id)
    .map_to(Story).to_a
  end

  def having_comments_at(date_range)
    stories
      .join(comments)
      .where(comments[:created_at].qualified => date_range)
      .group(:id)
      .map_to(Story).to_a
  end
end