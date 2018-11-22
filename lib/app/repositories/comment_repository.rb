class CommentRepository < Hanami::Repository
  associations do
    belongs_to :story
    belongs_to :user
    # belongs_to :user, as: :commenter
  end

  def commenter_for(comment)
    assoc(:user, comment).one
  end
end
