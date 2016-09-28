# frozen_string_literal: true
module LoginMacros
  def login_as_admin(user_type = :normal_user)
    let(:admin_user) { create :event_admin_user, user_type }
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin_user]
      sign_in admin_user
    end
  end

  def login_as_user
    let(:user) { create :event_user }
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end
  end
end
