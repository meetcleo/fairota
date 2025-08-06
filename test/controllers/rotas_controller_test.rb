require "test_helper"

class RotasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rota = rotas(:one)
  end

  test "should get index" do
    get rotas_url
    assert_response :success
  end

  test "should get new" do
    get new_rota_url
    assert_response :success
  end

  test "should create rota" do
    assert_difference("Rota.count") do
      post rotas_url, params: { rota: { description: @rota.description, title: @rota.title } }
    end

    assert_redirected_to rota_url(Rota.last)
  end

  test "should show rota" do
    get rota_url(@rota)
    assert_response :success
  end

  test "should get edit" do
    get edit_rota_url(@rota)
    assert_response :success
  end

  test "should update rota" do
    patch rota_url(@rota), params: { rota: { description: @rota.description, title: @rota.title } }
    assert_redirected_to rota_url(@rota)
  end

  test "should not destroy rota" do
    assert_no_difference("Rota.count") do
      delete rota_url(@rota)
    end

    assert_redirected_to rotas_url
  end
end
