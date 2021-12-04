defmodule ElixirPokedex.Pokeapi.Client do
  @moduledoc """
  A module for interacting with the pokeapi.co
  """

  require Logger

  use Tesla

  @user_agent Application.compile_env!(:elixir_pokedex, :user_agent)

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json; charset=utf-8"},
    {"user-agent", @user_agent}
  ]

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Logger

  @spec get_by_name(name :: String.t()) :: {:ok, Tesla.Env.t()} | {:error, any()}
  def get_by_name(name) do
    get("pokemon-species/#{name}")
  end
end
