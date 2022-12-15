import Config

config :assignment_first, ecto_repos: [First.Repo]
config :assignment_first,First.Repo,
  database: "assignment_first",
  username: "sayan",
  password: "sayan1231",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
