RSpec.describe StoryRepository, type: :repository do
  let(:repo) { described_class.new }

  context '#find_with_comments' do
    let!(:comment) { Fabricate.create(:comment) }

    specify 'the comments will be populated' do
      story = repo.find_with_comments(comment.story_id)
      expect(story.id).to_not be_nil
      expect(story.author).to_not be_nil
      expect(story.comments).to_not be_nil
      # expect(story.comments.first.commenter).to_not be_nil
      expect(story.comments.first.user).to_not be_nil
    end
  end

  context '#find_with_commenters' do
    let!(:comment) { Fabricate.create(:comment) }

    specify 'the comments will be populated' do
      story = repo.find_with_commenters(comment.story_id)
      expect(story.id).to_not be_nil
      binding.pry
      expect(story.users).to_not be_nil
      # expect(story.commenters).to_not be_nil
    end
  end

  context '#with_comments_at' do
    let(:story_1) { Fabricate(:story) }
    let!(:comment_1_1) { Fabricate.create(:comment, story_id: story_1.id) }
    let!(:comment_1_2) { Fabricate.create(:comment, story_id: story_1.id) }
    let(:story_2) { Fabricate(:story) }
    let!(:comment_2_1) { Fabricate.create(:comment, story_id: story_2.id) }
    let!(:comment_2_2) { Fabricate.create(:comment, story_id: story_2.id) }

    specify 'the stories will contain the comments too' do
      stories = repo.with_comments_at(1.day.ago..1.day.from_now)
      expect(stories.size).to eq([story_1, story_2].count)
      expect(stories.first.comments.size).to eq([comment_1_1, comment_1_2].count)
    end
  end

  context '#having_comments_at' do
    let(:story_1) { Fabricate(:story) }
    let!(:comment_1_1) { Fabricate.create(:comment, story_id: story_1.id) }
    let!(:comment_1_2) { Fabricate.create(:comment, story_id: story_1.id) }
    let(:story_2) { Fabricate(:story) }
    let!(:comment_2_1) { Fabricate.create(:comment, story_id: story_2.id) }
    let!(:comment_2_2) { Fabricate.create(:comment, story_id: story_2.id) }

    specify 'the stories will contain the comments too' do
      stories = repo.having_comments_at(1.day.ago..1.day.from_now)
      expect(stories.size).to eq([story_1, story_2].count)
      expect(stories.first.comments).to be_nil
    end
  end

  context '#with_comments' do
    let(:story_1) { Fabricate(:story) }
    let!(:comment_1_1) { Fabricate.create(:comment, story_id: story_1.id) }
    let!(:comment_1_2) { Fabricate.create(:comment, story_id: story_1.id) }
    let(:story_2) { Fabricate(:story) }
    let!(:comment_2_1) { Fabricate.create(:comment, story_id: story_2.id) }
    let!(:comment_2_2) { Fabricate.create(:comment, story_id: story_2.id) }

    specify 'the stories will contain the comments too' do
      stories = repo.with_comments()
      expect(stories.size).to eq([story_1, story_2].count)
      expect(stories.first.comments).to_not be_nil
      expect(stories.first.comments.size).to eq([comment_1_2, comment_1_2].count)
      expect(stories.last.comments).to_not be_nil
      expect(stories.last.comments.size).to eq([comment_2_2, comment_2_2].count)
    end
  end
end
