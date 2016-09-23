# frozen_string_literal: true
class Admin::BaseController < ApplicationController
  before_action :authenticate_admin_user!

  private

  def authenticate_as_super_admin!
    raise AppErrors::Error403 unless current_admin_user.is_super_user? && return
  end
end
