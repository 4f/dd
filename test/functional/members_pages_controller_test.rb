require 'test_helper'

class MembersPagesControllerTest < ActionController::TestCase
  setup do
    @members_page = members_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create members_page" do
    assert_difference('MembersPage.count') do
      post :create, members_page: { concert_id: @members_page.concert_id, text_guest: @members_page.text_guest, text_lead: @members_page.text_lead, text_member: @members_page.text_member }
    end

    assert_redirected_to members_page_path(assigns(:members_page))
  end

  test "should show members_page" do
    get :show, id: @members_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @members_page
    assert_response :success
  end

  test "should update members_page" do
    put :update, id: @members_page, members_page: { concert_id: @members_page.concert_id, text_guest: @members_page.text_guest, text_lead: @members_page.text_lead, text_member: @members_page.text_member }
    assert_redirected_to members_page_path(assigns(:members_page))
  end

  test "should destroy members_page" do
    assert_difference('MembersPage.count', -1) do
      delete :destroy, id: @members_page
    end

    assert_redirected_to members_pages_path
  end
end
