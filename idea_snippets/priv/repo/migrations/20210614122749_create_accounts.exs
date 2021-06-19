defmodule IdeaSnippets.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :user_id, :integer
      add :name, :string
      add :icon, :text

      timestamps()
    end

  end
end
