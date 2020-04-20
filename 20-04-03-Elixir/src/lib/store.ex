defmodule Store do
  def start do
    spawn(fn -> loop(%{}) end)
  end

  def loop(state) do
    receive do
      {:get, caller_pid, key} ->
        send(caller_pid, {:response, Map.get(state, key)})
        loop(state)
      {:put, key, value} ->
        new_state = Map.put(state, key, value)
        loop(new_state)
    end
  end

  def put(store_pid, key, value) do
    send(store_pid, {:put, key, value})
  end

  def get(store_pid, key) do
    send(store_pid, {:get, self(), key})

    receive do
      {:response, state} -> state
    end
  end
end