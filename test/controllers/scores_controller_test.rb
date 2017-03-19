require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  test "index shows added scores in descending order with relevant information" do
    Score.create(player: players(:igor), character: "HolyBananaGrower", entry: "died", points: 500)
    Score.create(player: players(:vlad), character: "HolyBananaGrower", entry: "died", points: 1000)
    Score.create(character: "The Who", entry: "died", points: 666)
    get root_url
    assert_equal response.body.scan("Igor").count, 1
    assert_equal response.body.scan("Vladimir").count, 1
    assert_equal response.body.scan("<a href=\"#{players(:igor).attnam_link}\">Igor</a>").count, 1
    assert_equal response.body.scan("<a href=\"#{players(:vlad).attnam_link}\">Vladimir</a>").count, 0
    assert_equal response.body.scan("HolyBananaGrower").count, 2
    assert_operator response.body.index("1,000"), :<, response.body.index("500")
  end

  test "doesn't submit score with invalid username or password" do
    assert_no_difference 'Score.count' do
      post submit_score_url, params: { format: 'json', username: "Igor",
        password: "wrong", score: 234, entry: "iggy, killed by a mutant bunny" }
    end
    assert_response 401
  end

  test "submits score with valid username and password" do
    assert_difference 'Score.count' do
      post submit_score_url, params: { format: 'json', username: "Igor",
        password: "secret", score: 234, entry: "iggy, killed by a mutant bunny" }
    end
    assert_response 200
    assert_equal Score.order("created_at").last.player, players(:igor)
  end
end
