import Config

config :sequence,
ecto_repos: [Sequence.Repo]

config :sequence, Sequence.Repo,
  database: "demo_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
