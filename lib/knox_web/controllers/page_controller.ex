defmodule KnoxWeb.PageController do
  use KnoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
