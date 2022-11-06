require "test_helper"

class Public::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_games_index_url
    assert_response :success
  end

  test "should get show" do
    get public_games_show_url
    assert_response :success
  end

  test "should get pc" do
    get public_games_pc_url
    assert_response :success
  end

  test "should get ps" do
    get public_games_ps_url
    assert_response :success
  end

  test "should get switch" do
    get public_games_switch_url
    assert_response :success
  end

  test "should get portable" do
    get public_games_portable_url
    assert_response :success
  end

  test "should get smartphone" do
    get public_games_smartphone_url
    assert_response :success
  end
end
