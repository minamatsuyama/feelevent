require "rails_helper"

describe Api::FavoritesController do
  describe "GET #index" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:event_user)
      sign_in user
    end
    it "require login" do
      get :index
      expect(response.status).not_to eq(401)
    end
    it "get empty event_item result" do
      get :index, params: { page: 99999, per_page: 100 }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).to be_empty
    end
    it "get event_item result" do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).not_to be_empty
    end
  end
end
