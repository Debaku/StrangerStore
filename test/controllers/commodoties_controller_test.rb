require 'test_helper'

class CommodotiesControllerTest < ActionController::TestCase
  setup do
    @commodoty = commodoties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commodoties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commodoty" do
    assert_difference('Commodoty.count') do
      post :create, commodoty: { cost: @commodoty.cost, description: @commodoty.description, name: @commodoty.name, price: @commodoty.price, quantity: @commodoty.quantity, quantitySold: @commodoty.quantitySold }
    end

    assert_redirected_to commodoty_path(assigns(:commodoty))
  end

  test "should show commodoty" do
    get :show, id: @commodoty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commodoty
    assert_response :success
  end

  test "should update commodoty" do
    patch :update, id: @commodoty, commodoty: { cost: @commodoty.cost, description: @commodoty.description, name: @commodoty.name, price: @commodoty.price, quantity: @commodoty.quantity, quantitySold: @commodoty.quantitySold }
    assert_redirected_to commodoty_path(assigns(:commodoty))
  end

  test "should destroy commodoty" do
    assert_difference('Commodoty.count', -1) do
      delete :destroy, id: @commodoty
    end

    assert_redirected_to commodoties_path
  end
end
