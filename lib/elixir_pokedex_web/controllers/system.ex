defmodule ElixirPokedexWeb.Controllers.System do
  @moduledoc false

  use Phoenix.Controller, namespace: ElixirPokedexWeb

  def not_found(conn, _params), do: send_resp(conn, 404, "")
end
