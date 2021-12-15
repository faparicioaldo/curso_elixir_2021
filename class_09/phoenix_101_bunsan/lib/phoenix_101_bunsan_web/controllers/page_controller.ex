defmodule Phoenix101BunsanWeb.PageController do
  use Phoenix101BunsanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
