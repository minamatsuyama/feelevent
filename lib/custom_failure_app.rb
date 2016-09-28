# frozen_string_literal: true
class CustomFailureApp < Devise::FailureApp
  def respond
    if request.format == :json
      if request.parameters['controller'] == 'api/favorites'
        json_error_response
      else
        super
      end
    else
      super
    end
  end

  def json_error_response
    # i18n_message use content from devise.ja.yml/devise.en.yml
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = { message: 'Unauthorized' }.to_json
  end
end
