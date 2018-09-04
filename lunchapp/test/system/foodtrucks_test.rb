require "application_system_test_case"

class FoodtrucksTest < ApplicationSystemTestCase
  setup do
    @foodtruck = foodtrucks(:one)
  end

  test "visiting the index" do
    visit foodtrucks_url
    assert_selector "h1", text: "Foodtrucks"
  end

  test "creating a FoodTruck" do
    visit foodtrucks_url
    click_on "New FoodTruck"

    click_on "Create FoodTruck"

    assert_text "FoodTruck was successfully created"
    click_on "Back"
  end

  test "updating a FoodTruck" do
    visit foodtrucks_url
    click_on "Edit", match: :first

    click_on "Update FoodTruck"

    assert_text "FoodTruck was successfully updated"
    click_on "Back"
  end

  test "destroying a FoodTruck" do
    visit foodtrucks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "FoodTruck was successfully destroyed"
  end
end
