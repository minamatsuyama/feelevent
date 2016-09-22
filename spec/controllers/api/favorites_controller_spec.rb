require "rails_helper"

describe Api::FavoritesController do
  describe "DELETE #delete" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:event_user)
      sign_in user
    end
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
    it "require user signed in"
    it "require valid event_item"
    it "require event_favorite existed"
    it "delete event_favorite"
  end
end
