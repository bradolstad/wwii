require 'test_helper'

class UnitClassesControllerTest < ActionController::TestCase
  setup do
    @unit_class = unit_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_class" do
    assert_difference('UnitClass.count') do
      post :create, unit_class: { name: @unit_class.name }
    end

    assert_redirected_to unit_class_path(assigns(:unit_class))
  end

  test "should show unit_class" do
    get :show, id: @unit_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_class
    assert_response :success
  end

  test "should update unit_class" do
    put :update, id: @unit_class, unit_class: { name: @unit_class.name }
    assert_redirected_to unit_class_path(assigns(:unit_class))
  end

  test "should destroy unit_class" do
    assert_difference('UnitClass.count', -1) do
      delete :destroy, id: @unit_class
    end

    assert_redirected_to unit_classes_path
  end
end
