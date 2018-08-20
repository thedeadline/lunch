require "application_system_test_case"

class FoodtrucksTest < ApplicationSystemTestCase
  setup do
    @foodtruck = foodtrucks(:one)
  end

  test "visiting the index" do
    visit foodtrucks_url
    assert_selector "h1", text: "Foodtrucks"
  end

  test "creating a Foodtruck" do
    visit foodtrucks_url
    click_on "New Foodtruck"

    click_on "Create Foodtruck"

    assert_text "Foodtruck was successfully created"
    click_on "Back"
  end

  test "updating a Foodtruck" do
    visit foodtrucks_url
    click_on "Edit", match: :first

    click_on "Update Foodtruck"

    assert_text "Foodtruck was successfully updated"
    click_on "Back"
  end

  test "destroying a Foodtruck" do
    visit foodtrucks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foodtruck was successfully destroyed"
  end
end
