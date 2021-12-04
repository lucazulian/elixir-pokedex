defmodule ElixirPokedex.Funtranslations.Client do
  @moduledoc """
  A module for interacting with the funtranslations.com
  """

  require Logger

  use Tesla

  @user_agent Application.compile_env!(:elixir_pokedex, :user_agent)
  @type translation_type :: :yoda | :shakespeare

  plug Tesla.Middleware.BaseUrl, "http://api.funtranslations.com"

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json; charset=utf-8"},
    {"user-agent", @user_agent}
  ]

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Logger

  @spec translate(text :: String.t(), translator_type :: translation_type()) ::
          {:ok, Tesla.Env.t()} | {:error, any()}
  def translate(text, translator_type) do
    query = URI.encode_query(%{"text" => text})
    get("translate/#{translator_type}?#{query}")
  end
end
