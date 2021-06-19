defmodule IdeaSnippetsWeb.PageController do
  use IdeaSnippetsWeb, :controller

  alias IdeaSnippets.Codes
  alias IdeaSnippets.Accounts

  def index(conn, _params) do
    posts = Codes.list_posts()
    users = Accounts.list_accounts()
    accounts = users
    |> Enum.map( & &1.user_id )
    |> Enum.uniq
    |> Enum.map( &  %{ "user" => Accounts.get_user!(&1), "account" => Accounts.get_account_by_user_id(&1) } )
    |> Enum.reduce( %{}, & Map.put(&2,  &1[ "user" ].id, (if &1["account"].name == nil, do: %{ email: &1[ "user" ].email, name: &1["user"].email }, else: %{ email: &1[ "user" ].email, name: &1["account"].name } ) ) )
    render(conn, "index.html", posts: posts, accounts: accounts)
  end

end
