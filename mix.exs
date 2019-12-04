defmodule Sequence.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Sequence.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.2"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
