require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rota = rotas(:one)
  end

  test "should get create" do
    assert_difference(-> { @rota.members.count }) do
      get members_create_url(rota_id: @rota, member: { name: 'Murad' })
    end
    assert_redirected_to rota_url(@rota)
  end
end
