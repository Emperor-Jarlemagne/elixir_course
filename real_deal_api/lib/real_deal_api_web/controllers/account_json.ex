defmodule RealDealApiWeb.AccountJSON do
  alias RealDealApi.Accounts.Account
  alias RealDealApiWeb.Auth.Guardian

  def account(%{account: account}) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end

  defp data(%Account{} = account) do
    {:ok, token, _} = Guardian.encode_and_sign(account)
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password,
      token: token
    }
  end

  def show(%{account: account}) do
    %{data: data(account)}
  end

  # def show(_conn, %{account: account, token: token}) do
  #   %{data: data(account, token)}
  # end

  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end
end
