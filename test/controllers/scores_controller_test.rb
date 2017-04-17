require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  test "index shows added scores in descending order with relevant information" do
    Score.create(player: players(:igor), character: "HolyBananaGrower", entry: "died", points: 500, version: versions(:v05010))
    Score.create(player: players(:vlad), character: "HolyBananaGrower", entry: "died", points: 1000, version: versions(:v0509))
    Score.create(character: "The Who", entry: "died", points: 666, version: versions(:v0509))
    get root_url
    assert_equal 1, response.body.scan("Igor").count
    assert_equal 1, response.body.scan("Vladimir").count
    assert_equal 1, response.body.scan("<a href=\"#{players(:igor).attnam_link}\">Igor</a>").count
    assert_equal 0, response.body.scan("<a href=\"#{players(:vlad).attnam_link}\">Vladimir</a>").count
    assert_equal 2, response.body.scan("HolyBananaGrower").count
    assert_operator response.body.index("1,000"), :<, response.body.index("500")
  end

  test "doesn't submit score with invalid username or password" do
    assert_no_difference 'Score.count' do
      post submit_score_url, params: { format: 'json', username: "Igor",
        auth_token: players(:vlad).auth_token, score: 234, entry: "iggy, killed by a mutant bunny" }
    end
    assert_response 401
  end

  test "submits score with valid username and password" do
    assert_difference 'Score.count' do
      post submit_score_url, params: { format: 'json', username: "Igor",
        auth_token: players(:igor).auth_token, score: 234, entry: "iggy, killed by a mutant bunny" }
    end
    assert_response 200
    assert_equal players(:igor), Score.order("created_at").last.player
  end

  test "submits score as anonymous if no username was provided" do
    assert_difference 'Score.count' do
      post submit_score_url, params: { format: 'json', username: "",
        score: 234, entry: "iggy, killed by a mutant bunny" }
    end
    assert_response 200
    assert_nil Score.order("created_at").last.player
  end
end
