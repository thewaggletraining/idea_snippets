defmodule IdeaSnippets.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaSnippets.Codes.Post

  schema "accounts" do
    field :icon, :string
    field :name, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:user_id, :name, :icon])
    |> validate_required([:user_id])
  end
end
