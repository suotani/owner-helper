require 'test_helper'

class PhoneListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get phone_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get phone_lists_show_url
    assert_response :success
  end

end
