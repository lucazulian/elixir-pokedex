defmodule ElixirPokedexWeb.Controllers.Pokemon do
  @moduledoc false

  use Phoenix.Controller, namespace: ElixirPokedexWeb

  def ping(conn, _params), do: send_resp(conn, 200, "pong")
end
