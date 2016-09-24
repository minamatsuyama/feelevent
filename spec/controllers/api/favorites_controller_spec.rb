require "rails_helper"

describe Api::FavoritesController do
  describe "GET #index" do
    before(:each) do |testcase|
      unless testcase.metadata[:skip_before]
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryGirl.create(:event_user)
        sign_in user
      end
    end
    it "is not signed in", skip_before: true do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(response.status).to eq(401)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
    it "get empty event_item result" do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).to be_empty
    end
    it "get event_item result" do
      event_item = FactoryGirl.create(:event_item, published: true, publish_started_at: Time.current - 1.days, publish_ended_at: Time.current + 1.days)
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).not_to be_empty
    end
  end
end
