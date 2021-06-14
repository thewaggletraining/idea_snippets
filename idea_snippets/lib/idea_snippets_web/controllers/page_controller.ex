defmodule IdeaSnippetsWeb.PageController do
  use IdeaSnippetsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
