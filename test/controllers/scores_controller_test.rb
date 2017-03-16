require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  test "index shows added scores in descending order with relevant information" do
    Score.create(player: players(:igor), character: "HolyBananaGrower", points: 500)
    Score.create(player: players(:vlad), character: "HolyBananaGrower", points: 1000)
    get root_url
    assert_equal response.body.scan("Igor").count, 1
    assert_equal response.body.scan("Vladimir").count, 1
    assert_equal response.body.scan("<a href=\"#{players(:igor).attnam_link}\">Igor</a>").count, 1
    assert_equal response.body.scan("<a href=\"#{players(:vlad).attnam_link}\">Vladimir</a>").count, 0
    assert_equal response.body.scan("HolyBananaGrower").count, 2
    assert_operator response.body.index("1000"), :<, response.body.index("500")
  end
end
