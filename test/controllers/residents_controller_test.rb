require 'test_helper'

class ResidentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get residents_show_url
    assert_response :success
  end

end
