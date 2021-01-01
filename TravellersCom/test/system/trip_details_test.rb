require "application_system_test_case"

class TripDetailsTest < ApplicationSystemTestCase
  setup do
    @trip_detail = trip_details(:one)
  end

  test "visiting the index" do
    visit trip_details_url
    assert_selector "h1", text: "Trip Details"
  end

  test "creating a Trip detail" do
    visit trip_details_url
    click_on "New Trip Detail"

    fill_in "Description", with: @trip_detail.description
    fill_in "Enddate", with: @trip_detail.endDate
    fill_in "Location", with: @trip_detail.location
    fill_in "Startdate", with: @trip_detail.startDate
    fill_in "User", with: @trip_detail.user_id
    click_on "Create Trip detail"

    assert_text "Trip detail was successfully created"
    click_on "Back"
  end

  test "updating a Trip detail" do
    visit trip_details_url
    click_on "Edit", match: :first

    fill_in "Description", with: @trip_detail.description
    fill_in "Enddate", with: @trip_detail.endDate
    fill_in "Location", with: @trip_detail.location
    fill_in "Startdate", with: @trip_detail.startDate
    fill_in "User", with: @trip_detail.user_id
    click_on "Update Trip detail"

    assert_text "Trip detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip detail" do
    visit trip_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip detail was successfully destroyed"
  end
end
