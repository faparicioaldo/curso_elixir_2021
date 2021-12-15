defmodule PhoeXWeb.PageController do
  use PhoeXWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
