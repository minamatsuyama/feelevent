require "rails_helper"

describe Api::EventsController do
  describe "GET #index" do
    it "get empty event_item result" do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).to be_empty
    end
    it "get event_item result" do
      event_item = FactoryGirl.create(:event_item)
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).not_to be_empty
    end
    it "get event_item with params event_types"
    it "get event_item with params keyword_ids"
    it "get event_item with params word"
    it "get event_item with params entry_fee"
    it "get event_item with params held_area"
    it "get event_item with params held_started_on"
    it "get event_item with params held_ended_on"
    it "get event_item with params qualifying_age_id"
  end
end
