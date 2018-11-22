RSpec.describe CommentRepository, type: :repository do
  let(:repo) { described_class.new }

  context '#commenter_for' do
    let!(:comment) { Fabricate.create(:comment) }

    specify 'commenter_for' do
      commenter = repo.commenter_for(comment)
      expect(commenter.id).to eq(comment.user_id)
    end
  end
end
