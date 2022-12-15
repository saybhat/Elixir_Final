# to_do_elixir
TODO app built using Elixir Plug and Cowboy

Note: config/config.exe change the username and password to your own else database with fail during "ecto.create"

#### To Run

```sh
git clone https://github.com/saybhat/Elixir_Final.git
cd  Elixir_cowboy_plug
mix deps.get
mix ecto.create
mix ecto.migrate
iex -S mix
```
