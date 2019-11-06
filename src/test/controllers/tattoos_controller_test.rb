require 'test_helper'

class TattoosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tattoos_index_url
    assert_response :success
  end

  test "should get show" do
    get tattoos_show_url
    assert_response :success
  end

  test "should get create" do
    get tattoos_create_url
    assert_response :success
  end

  test "should get edit" do
    get tattoos_edit_url
    assert_response :success
  end

  test "should get update" do
    get tattoos_update_url
    assert_response :success
  end

end
