require 'test_helper'

class SalexcommsControllerTest < ActionController::TestCase
  setup do
    @salexcomm = salexcomms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salexcomms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salexcomm" do
    assert_difference('Salexcomm.count') do
      post :create, salexcomm: { quanxcomm: @salexcomm.quanxcomm, subtotal: @salexcomm.subtotal }
    end

    assert_redirected_to salexcomm_path(assigns(:salexcomm))
  end

  test "should show salexcomm" do
    get :show, id: @salexcomm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salexcomm
    assert_response :success
  end

  test "should update salexcomm" do
    patch :update, id: @salexcomm, salexcomm: { quanxcomm: @salexcomm.quanxcomm, subtotal: @salexcomm.subtotal }
    assert_redirected_to salexcomm_path(assigns(:salexcomm))
  end

  test "should destroy salexcomm" do
    assert_difference('Salexcomm.count', -1) do
      delete :destroy, id: @salexcomm
    end

    assert_redirected_to salexcomms_path
  end
end
