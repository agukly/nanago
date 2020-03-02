require 'test_helper'

class PramsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prams_new_url
    assert_response :success
  end

  test "should get show" do
    get prams_show_url
    assert_response :success
  end

  test "should get index" do
    get prams_index_url
    assert_response :success
  end

end
