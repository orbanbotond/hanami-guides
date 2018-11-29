# frozen_string_literal: true

describe Stories::Operations::Create do
  let(:repo) { StoryRepository.new }
  let(:options) { {} }
  let(:user) { Fabricate.create(:user) }
  let(:params) { Fabricate.attributes_for(:story).merge user_id: user.id }
  let(:result) { described_class.call(params, options) }

  context "negative cases" do
    context "missing params" do
      [:text, :user_id].each do |field|
        let(:params) { super().reject{ |k| k == field } }

        it "returns failure and sets result.contract.default" do
          expect(result.failure?).to be_truthy
          expect(result["result.contract.default"].failure?).to be_truthy
        end
      end
    end

    context "user_id is nonexistent" do
      let(:params) { super().merge(user_id: -1) }

      it "returns failure and sets result.contract.default" do
        expect(result.failure?).to be_truthy
        expect(result["result.fk_reference.default"].failure?).to be_truthy
        expect(result["result.fk_reference.key"]).to eq(:user_id)
      end
    end
  end

  context "positive case" do
    it "saves the entity properly details" do
      expect do
        expect(result["result.model"].text).to eq(params[:text])
        expect(result["result.model"].user_id).to eq(params[:user_id])
      end.to change { repo.all.count }.by(1)
    end
  end
end
