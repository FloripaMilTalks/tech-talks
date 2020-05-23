# TechTalk

Presentation commands:

## Processes

> `self()`

> `pid = spawn(fn -> 2 + 2 end)`

> `Process.alive?(pid)`

> `pid = spawn(fn -> IO.puts(2 + 2) end)`

> `pid = spawn(fn -> IO.puts(2 + 2); Process.sleep(3000) end)`

> `Process.alive?(pid)`

## Process communication

> `flush()`

> `pid = self()`

> `send(self(), "a message")`

> `flush()`

## Dubm React store

> `store = %{}`

> `store = DumbStore.put(store, :key, "a value")`

> `DumbStore.get(store, :key)`

> `DumbStore.put(store, :another_key, "another value")`

### React store

> `store_pid = Store.start()`

> `Process.alive?(store.pid)`

> `Store.put(store_pid, :key, 90)`

> `Store.get(store_pid, :key)`

## "Let it crash" philosophy

> `{:ok, monixer_pid} = Monixer.start_link()`

> `Process.alive?(monixer_pid)`

- kill PostgreSQL

- restart PostgreSQL

### With a Supervisor

> `{:ok, monixer_pid} = MySupervisor.start_link()`

> `Supervisor.which_children(monixer_pid)`

- kill postgresl

- wait until the connection dies

- restart PostgreSQL

> `Supervisor.which_children(monixer_pid)`

> `monixer_pid`

- stop the terminal

## Hot code reloading

> `spawn(fn -> Counter.count(0) end)`

- change the Counter module

> `r Counter`

> `spawn(fn -> Counter.count(0) end)`