RSpec.describe StoryRepository, type: :repository do
  let(:repo) { described_class.new }

  context '#find_with_comments' do
    let!(:comment) { Fabricate.create(:comment) }

    specify 'the comments will be populated' do
      story = repo.find_with_comments(comment.story_id)
      expect(story.id).to_not be_nil
      expect(story.author).to_not be_nil
      expect(story.comments).to_not be_nil
      # expect(story.comments.first.user).to_not be_nil
      expect(story.comments.first.commenter).to_not be_nil
    end
  end

  # context '#find_with_commenters' do
  #   let!(:comment) { Fabricate.create(:comment) }

  #   specify 'the comments will be populated' do
  #     story = repo.find_with_commenters(comment.story_id)
  #     expect(story.id).to_not be_nil
  #     binding.pry
  #     expect(story.commenters).to_not be_nil
  #   end
  # end
end
