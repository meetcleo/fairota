require "application_system_test_case"

class RotasTest < ApplicationSystemTestCase
  setup do
    @rota = rotas(:one)
  end

  test "visiting the index" do
    visit rotas_url
    assert_selector "h1", text: "Rotas"
  end

  test "should create rota" do
    visit rotas_url
    click_on "New rota"

    fill_in "Description", with: @rota.description
    fill_in "Title", with: @rota.title
    click_on "Create Rota"

    assert_text "Rota was successfully created"
    click_on "Back"
  end

  test "should update Rota" do
    visit rota_url(@rota)
    click_on "Edit this rota", match: :first

    fill_in "Description", with: @rota.description
    fill_in "Title", with: @rota.title
    click_on "Update Rota"

    assert_text "Rota was successfully updated"
    click_on "Back"
  end

  test "should destroy Rota" do
    visit rota_url(@rota)
    click_on "Destroy this rota", match: :first

    assert_text "Rota was successfully destroyed"
  end
end
