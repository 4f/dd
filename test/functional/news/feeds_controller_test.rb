require 'test_helper'

class News::FeedsControllerTest < ActionController::TestCase
  setup do
    @news_feed = news_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_feed" do
    assert_difference('News::Feed.count') do
      post :create, news_feed: { author: @news_feed.author, date: @news_feed.date, preambula: @news_feed.preambula, text: @news_feed.text, title: @news_feed.title }
    end

    assert_redirected_to news_feed_path(assigns(:news_feed))
  end

  test "should show news_feed" do
    get :show, id: @news_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_feed
    assert_response :success
  end

  test "should update news_feed" do
    put :update, id: @news_feed, news_feed: { author: @news_feed.author, date: @news_feed.date, preambula: @news_feed.preambula, text: @news_feed.text, title: @news_feed.title }
    assert_redirected_to news_feed_path(assigns(:news_feed))
  end

  test "should destroy news_feed" do
    assert_difference('News::Feed.count', -1) do
      delete :destroy, id: @news_feed
    end

    assert_redirected_to news_feeds_path
  end
end
