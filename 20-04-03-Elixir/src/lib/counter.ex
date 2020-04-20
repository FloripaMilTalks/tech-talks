defmodule Counter do
    def count(n) do
        Process.sleep(2000)
        IO.puts("----------------> #{inspect self()}: #{n}")
        count(n + 2)
    end
end