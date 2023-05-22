require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "should create inventory" do
    visit inventories_url
    click_on "New inventory"

    fill_in "Day left", with: @inventory.day_left
    fill_in "Exp day", with: @inventory.exp_day
    fill_in "Import day", with: @inventory.import_day
    fill_in "Name", with: @inventory.name
    fill_in "Provider", with: @inventory.provider
    fill_in "Quantity", with: @inventory.quantity
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    fill_in "Day left", with: @inventory.day_left
    fill_in "Exp day", with: @inventory.exp_day
    fill_in "Import day", with: @inventory.import_day
    fill_in "Name", with: @inventory.name
    fill_in "Provider", with: @inventory.provider
    fill_in "Quantity", with: @inventory.quantity
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
