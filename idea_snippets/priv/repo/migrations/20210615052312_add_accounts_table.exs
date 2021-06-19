defmodule IdeaSnippets.Repo.Migrations.AddAccountsTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :account_id, references(:accounts, on_delete: :delete_all)    end

  end
end
