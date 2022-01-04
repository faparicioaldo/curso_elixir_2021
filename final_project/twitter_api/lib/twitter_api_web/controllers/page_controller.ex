defmodule TwitterApiWeb.PageController do
  use TwitterApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
