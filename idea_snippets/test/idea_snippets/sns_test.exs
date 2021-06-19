defmodule IdeaSnippets.SNSTest do
  use IdeaSnippets.DataCase

  alias IdeaSnippets.SNS

  describe "accounts" do
    alias IdeaSnippets.SNS.Account

    @valid_attrs %{user_id: 42}
    @update_attrs %{user_id: 43}
    @invalid_attrs %{user_id: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SNS.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert SNS.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert SNS.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = SNS.create_account(@valid_attrs)
      assert account.user_id == 42
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SNS.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = SNS.update_account(account, @update_attrs)
      assert account.user_id == 43
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = SNS.update_account(account, @invalid_attrs)
      assert account == SNS.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = SNS.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> SNS.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = SNS.change_account(account)
    end
  end
end
