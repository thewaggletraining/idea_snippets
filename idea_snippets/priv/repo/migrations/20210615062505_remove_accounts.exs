defmodule IdeaSnippets.Repo.Migrations.RemoveAccounts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :account_id
    end

  end
end
