require "application_system_test_case"

class WarehouseChangesTest < ApplicationSystemTestCase
  setup do
    @warehouse_change = warehouse_changes(:one)
  end

  test "visiting the index" do
    visit warehouse_changes_url
    assert_selector "h1", text: "Warehouse Changes"
  end

  test "creating a Warehouse change" do
    visit warehouse_changes_url
    click_on "New Warehouse Change"

    fill_in "Product", with: @warehouse_change.product_id
    fill_in "Quantity", with: @warehouse_change.quantity
    fill_in "Reason", with: @warehouse_change.reason_id
    click_on "Create Warehouse change"

    assert_text "Warehouse change was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse change" do
    visit warehouse_changes_url
    click_on "Edit", match: :first

    fill_in "Product", with: @warehouse_change.product_id
    fill_in "Quantity", with: @warehouse_change.quantity
    fill_in "Reason", with: @warehouse_change.reason_id
    click_on "Update Warehouse change"

    assert_text "Warehouse change was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse change" do
    visit warehouse_changes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse change was successfully destroyed"
  end
end
