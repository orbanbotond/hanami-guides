# require "api_helper"

describe "POST /api/stories" do
  let!(:user) { Fabricate.create(:user) }
  let(:params) { { text: 'Lorem', user_id: user.id } }
  let(:path) { "/api/stories" }

  subject { post path, params: params, headers: {} }

  context 'negative cases' do
    context 'missing fields' do
      [:text, :user_id].each do |field|
        let(:params) { super().reject{|k| k == field } }

        it "expects 400" do
          expect_bad_request
          expect_json
        end
      end
    end

    context 'nonexistent user reference' do
      let(:params) { super().merge user_id: -1 }

      it "expects 404" do
        expect_not_found
        expect_json
      end
    end
  end

  context "positive cases" do
    it "returns 201" do
      expect_created
      expect_json
    end
  end
end
