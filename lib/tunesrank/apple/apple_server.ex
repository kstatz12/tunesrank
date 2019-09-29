defmodule AppleServer do
  use GenServer

  def init(_) do
    {:ok, conn} = Mint.HTTP.connect(:http, "itunes.apple.com", 443)
    {:ok, %{conn: conn}}
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def search_artist(pid, query) do
    GenServer.call(pid, {:search, query})
  end

  def handle_call({:search, query}, _from, state) do
    q = URI.encode_query(query)
    {:ok, conn, request} = Mint.HTTP.request(state.conn , "GET", "/search?"<> q, [], "")
    {:reply, [], %{conn: conn}}
  end

end
