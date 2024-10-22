require "application_system_test_case"

class ComentariesTest < ApplicationSystemTestCase
  setup do
    @comentary = comentaries(:one)
  end

  test "visiting the index" do
    visit comentaries_url
    assert_selector "h1", text: "Comentaries"
  end

  test "should create comentary" do
    visit comentaries_url
    click_on "New comentary"

    fill_in "Description", with: @comentary.description
    fill_in "Photos", with: @comentary.photos_id
    fill_in "User", with: @comentary.user_id
    click_on "Create Comentary"

    assert_text "Comentary was successfully created"
    click_on "Back"
  end

  test "should update Comentary" do
    visit comentary_url(@comentary)
    click_on "Edit this comentary", match: :first

    fill_in "Description", with: @comentary.description
    fill_in "Photos", with: @comentary.photos_id
    fill_in "User", with: @comentary.user_id
    click_on "Update Comentary"

    assert_text "Comentary was successfully updated"
    click_on "Back"
  end

  test "should destroy Comentary" do
    visit comentary_url(@comentary)
    click_on "Destroy this comentary", match: :first

    assert_text "Comentary was successfully destroyed"
  end
end
