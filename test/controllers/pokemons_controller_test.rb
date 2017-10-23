require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get capture" do
    get pokemons_capture_url
    assert_response :success
  end

  test "should get damage" do
    get pokemons_damage_url
    assert_response :success
  end

end
