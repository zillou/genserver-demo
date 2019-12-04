defmodule Sequence.Repo.Migrations.CreateCaches do
  use Ecto.Migration

  def change do
    create table(:caches) do
      add :module, :string
      add :cached_state, :binary

      timestamps()
    end
  end
end
