defmodule ElixirPokedex.Pokeapi.ClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias ElixirPokedex.Pokeapi.Client

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  test "on 200 response code client shoud return success response" do
    use_cassette "pokeapi/success", match_requests_on: [:query] do
      response = Client.get_by_name("bulbasaur")

      assert match?(
               {:ok,
                %Tesla.Env{
                  body: %{
                    "base_happiness" => 70,
                    "capture_rate" => 45,
                    "color" => %{
                      "name" => "green",
                      "url" => "https://pokeapi.co/api/v2/pokemon-color/5/"
                    },
                    "egg_groups" => [
                      %{"name" => "monster", "url" => "https://pokeapi.co/api/v2/egg-group/1/"},
                      %{"name" => "plant", "url" => "https://pokeapi.co/api/v2/egg-group/7/"}
                    ],
                    "evolution_chain" => %{
                      "url" => "https://pokeapi.co/api/v2/evolution-chain/1/"
                    },
                    "evolves_from_species" => nil,
                    "flavor_text_entries" => _flavor_text_entries
                  }
                }},
               response
             )
    end
  end
end
