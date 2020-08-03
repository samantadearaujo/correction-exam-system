defmodule ExamsWeb.PageController do
  use ExamsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
