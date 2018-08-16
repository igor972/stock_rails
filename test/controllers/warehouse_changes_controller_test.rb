require 'test_helper'

class WarehouseChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_change = warehouse_changes(:one)
  end

  test "should get index" do
    get warehouse_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_change_url
    assert_response :success
  end

  test "should create warehouse_change" do
    assert_difference('WarehouseChange.count') do
      post warehouse_changes_url, params: { warehouse_change: { product_id: @warehouse_change.product_id, quantity: @warehouse_change.quantity, reason_id: @warehouse_change.reason_id } }
    end

    assert_redirected_to warehouse_change_url(WarehouseChange.last)
  end

  test "should show warehouse_change" do
    get warehouse_change_url(@warehouse_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_change_url(@warehouse_change)
    assert_response :success
  end

  test "should update warehouse_change" do
    patch warehouse_change_url(@warehouse_change), params: { warehouse_change: { product_id: @warehouse_change.product_id, quantity: @warehouse_change.quantity, reason_id: @warehouse_change.reason_id } }
    assert_redirected_to warehouse_change_url(@warehouse_change)
  end

  test "should destroy warehouse_change" do
    assert_difference('WarehouseChange.count', -1) do
      delete warehouse_change_url(@warehouse_change)
    end

    assert_redirected_to warehouse_changes_url
  end
end
