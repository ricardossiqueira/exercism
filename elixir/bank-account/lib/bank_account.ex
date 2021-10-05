defmodule BankAccount do
  use GenServer

  @error_account_closed {:error, :account_closed}

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, account} = GenServer.start_link(__MODULE__, %{balance: 0, open: true})
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account), do: GenServer.cast(account, {:close})

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    [account: %{balance: balance, open: open}] = GenServer.call(account, :balance)

    if open do
      balance
    else
      @error_account_closed
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    [account: %{open: open}] = GenServer.call(account, :balance)

    if open do
      GenServer.cast(account, {:update, amount})
    else
      @error_account_closed
    end
  end

  # Server functions
  def init(account), do: {:ok, account: account}

  def handle_cast({:update, amount}, account: account) when account.open === true,
    do: {:noreply, [account: %{account | balance: account.balance + amount}]}

  def handle_cast({:close}, account: account) when account.open === true,
    do: {:noreply, [account: %{account | open: false}]}

  def handle_call(:balance, _from, balance), do: {:reply, balance, balance}
end
