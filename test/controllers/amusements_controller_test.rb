require "test_helper"

class AmusementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amusements_index_url
    assert_response :success
  end

  test "should get show" do
    get amusements_show_url
    assert_response :success
  end

  test "should get new" do
    get amusements_new_url
    assert_response :success
  end

  test "should get update" do
    get amusements_update_url
    assert_response :success
  end
end
