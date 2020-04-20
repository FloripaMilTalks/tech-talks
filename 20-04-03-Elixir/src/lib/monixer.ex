defmodule Monixer do
    use GenServer

    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    @impl true
    def init(state) do

        schedule_work()
        
        {:ok, state}
    end

    @impl true
    def handle_info(:work, state) do
        urls = get_urls()
        IO.inspect(urls)

        schedule_work()

        {:noreply, state}
    end

    def get_urls() do
        {:ok, database_pid} = Postgrex.start_link(
            hostname: "localhost",
            username: "postgres",
            password: "tolkien",
            database: "monixer"
        )

        %Postgrex.Result{rows: rows} = Postgrex.query!(database_pid, "SELECT url FROM urls LIMIT 5", [])

        rows
    end

    defp schedule_work do
        Process.send_after(self(), :work, 5000)
    end
end