require "application_system_test_case"

class RotationsTest < ApplicationSystemTestCase
  setup do
    @rotation = rotations(:one)
  end

  test "visiting the index" do
    visit rotations_url
    assert_selector "h1", text: "Rotations"
  end

  test "should create rotation" do
    visit rotations_url
    click_on "New rotation"

    fill_in "Description", with: @rotation.description
    fill_in "Title", with: @rotation.title
    click_on "Create Rotation"

    assert_text "Rotation was successfully created"
    click_on "Back"
  end

  test "should update Rotation" do
    visit rotation_url(@rotation)
    click_on "Edit this rotation", match: :first

    fill_in "Description", with: @rotation.description
    fill_in "Title", with: @rotation.title
    click_on "Update Rotation"

    assert_text "Rotation was successfully updated"
    click_on "Back"
  end

  test "should destroy Rotation" do
    visit rotation_url(@rotation)
    click_on "Destroy this rotation", match: :first

    assert_text "Rotation was successfully destroyed"
  end
end
