RSpec.describe StoryRepository, type: :repository do
  let(:repo) { described_class.new }

  # let!(:user) { Fabricate.create(:user) }
  # let!(:story) { Fabricate.create(:story) }

  context '#find_with_comments' do
    let!(:comment) { Fabricate.create(:comment) }

    specify 'the comments will be populated' do
      story = repo.find_with_comments(comment.story_id)
      expect(story.id).to_not be_nil
      expect(story.comments).to_not be_nil
      puts story.to_s
      puts story.comments.to_s
    end
  end

  # def find_with_comments(id)
  #   aggregate(:user, comments: :user).where(id: id).map_to(Story).one
  # end

  # def find_with_commenters(id)
  #   aggregate(:users).where(id: id).map_to(Story).one
  # end
end
