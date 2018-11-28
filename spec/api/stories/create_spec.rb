require "rack/test"

describe "POST /api/stories" do
  include Rack::Test::Methods

  let(:app) { Hanami.app }
  let!(:user) { Fabricate.create(:user) }
  let(:repo) { StoryRepository.new }

  let(:path) { "/api/stories" }
  let(:params) { {text: 'Lorem', user_id: user.id} }
  let(:headers) { {Accept: 'application/json', 'Content-Type': 'application/json'} }

  subject { post path,  params, {} }

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
      expect do
        expect_created
        expect_json
        expect_contains_field "text"
        expect_contains_field "id"
        expect_contains_field "user_id"
        expect(response_json["text"]).to eq(params[:text])
        expect(response_json["user_id"]).to eq(params[:user_id])
      end.to change { repo.all.count }.by(1)
    end
  end
end

# curl http://localhost:2300/api/stories    \
#   -H "Content-Type: application/json"     \
#   -H "Accept: application/json"           \
#   -d '{"text":"Lorem"}'                   \
#   -X POST
