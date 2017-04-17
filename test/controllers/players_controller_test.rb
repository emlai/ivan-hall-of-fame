require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "returns auth token with correct username and password" do
    get get_auth_token_url, params: { format: 'json', username: "Igor", password: "secret" }
    assert_response 200
    assert_equal players(:igor).auth_token, response.body
  end

  test "doesn't return auth token with incorrect password" do
    get get_auth_token_url, params: { format: 'json', username: "Igor", password: "wrong" }
    assert_response 401
  end
end
