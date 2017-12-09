require 'test_helper'

class DailiesControllerTest < ActionController::TestCase
  setup do
    @daily = dailies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily" do
    assert_difference('Daily.count') do
      post :create, daily: { access_amount: @daily.access_amount, d1: @daily.d1, d2: @daily.d2, daily_date: @daily.daily_date, oil: @daily.oil, p1: @daily.p1, p2: @daily.p2, short: @daily.short, worker1: @daily.worker1, worker2: @daily.worker2 }
    end

    assert_redirected_to daily_path(assigns(:daily))
  end

  test "should show daily" do
    get :show, id: @daily
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily
    assert_response :success
  end

  test "should update daily" do
    patch :update, id: @daily, daily: { access_amount: @daily.access_amount, d1: @daily.d1, d2: @daily.d2, daily_date: @daily.daily_date, oil: @daily.oil, p1: @daily.p1, p2: @daily.p2, short: @daily.short, worker1: @daily.worker1, worker2: @daily.worker2 }
    assert_redirected_to daily_path(assigns(:daily))
  end

  test "should destroy daily" do
    assert_difference('Daily.count', -1) do
      delete :destroy, id: @daily
    end

    assert_redirected_to dailies_path
  end
end
