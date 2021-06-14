defmodule IdeaSnippets.Codes.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias IdeaSnippets.Comments.Comment

  schema "posts" do
    field :code, :string
    field :description, :string
    field :title, :string
    has_many(:comments, Comment)

    field :published, Ecto.Enum, values: [:draft, :public, :limited, :private]

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :code, :published])
    |> validate_required([:title, :description, :code, :published])
  end
end
