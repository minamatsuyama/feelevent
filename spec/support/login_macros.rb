# frozen_string_literal: true
module LoginMacros
  def login_as_admin(user_type = :normal_user)
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin_user]
      sign_in FactoryGirl.create(:event_admin_user, user_type)
    end
  end

  def login_as_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:event_user)
    end
  end
end
