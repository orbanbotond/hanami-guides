class CommentRepository < Hanami::Repository
  associations do
    belongs_to :story
    belongs_to :user
  end
end
