defmodule Fprints.PageController do
  use Fprints.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
