require 'test_helper'

include ActionController::HttpAuthentication

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "returns auth token with correct username and password" do
    get get_auth_token_url, headers: {
      'HTTP_AUTHORIZATION' => Basic.encode_credentials('Igor', 'secret')
    }
    assert_response 200
    assert_equal players(:igor).auth_token, response.body
  end

  test "doesn't return auth token with incorrect password" do
    get get_auth_token_url, headers: {
      'HTTP_AUTHORIZATION' => Basic.encode_credentials('Igor', 'wrong')
    }
    assert_response 401
    assert_equal "HTTP Basic: Access denied.\n", response.body
  end
end
