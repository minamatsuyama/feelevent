require "rails_helper"

describe Api::FavoritesController do
  describe "POST #create" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:event_user)
      sign_in user
    end
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
    it "is user signed in"
    it "get valid event_item"
    it "is event_favorite not existed"
    it "create event_favorite"
  end
end
