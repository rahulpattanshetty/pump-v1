require 'test_helper'

class CreditsControllerTest < ActionController::TestCase
  setup do
    @credit = credits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post :create, credit: { amount: @credit.amount, cash_paid: @credit.cash_paid, daily_id: @credit.daily_id, is_paid: @credit.is_paid, litres: @credit.litres, name: @credit.name, oil_type: @credit.oil_type, paid_date: @credit.paid_date, phone_number: @credit.phone_number, purchase_date: @credit.purchase_date, rate: @credit.rate }
    end

    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should show credit" do
    get :show, id: @credit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit
    assert_response :success
  end

  test "should update credit" do
    patch :update, id: @credit, credit: { amount: @credit.amount, cash_paid: @credit.cash_paid, daily_id: @credit.daily_id, is_paid: @credit.is_paid, litres: @credit.litres, name: @credit.name, oil_type: @credit.oil_type, paid_date: @credit.paid_date, phone_number: @credit.phone_number, purchase_date: @credit.purchase_date, rate: @credit.rate }
    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete :destroy, id: @credit
    end

    assert_redirected_to credits_path
  end
end
