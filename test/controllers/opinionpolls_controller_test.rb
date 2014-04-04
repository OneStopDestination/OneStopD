require 'test_helper'

class OpinionpollsControllerTest < ActionController::TestCase
  setup do
    @opinionpoll = opinionpolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opinionpolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opinionpoll" do
    assert_difference('Opinionpoll.count') do
      post :create, opinionpoll: { constituency_id: @opinionpoll.constituency_id, description: @opinionpoll.description, option_selected: @opinionpoll.option_selected, options: @opinionpoll.options, user_id_created: @opinionpoll.user_id_created, user_id_voted: @opinionpoll.user_id_voted }
    end

    assert_redirected_to opinionpoll_path(assigns(:opinionpoll))
  end

  test "should show opinionpoll" do
    get :show, id: @opinionpoll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opinionpoll
    assert_response :success
  end

  test "should update opinionpoll" do
    patch :update, id: @opinionpoll, opinionpoll: { constituency_id: @opinionpoll.constituency_id, description: @opinionpoll.description, option_selected: @opinionpoll.option_selected, options: @opinionpoll.options, user_id_created: @opinionpoll.user_id_created, user_id_voted: @opinionpoll.user_id_voted }
    assert_redirected_to opinionpoll_path(assigns(:opinionpoll))
  end

  test "should destroy opinionpoll" do
    assert_difference('Opinionpoll.count', -1) do
      delete :destroy, id: @opinionpoll
    end

    assert_redirected_to opinionpolls_path
  end
end
