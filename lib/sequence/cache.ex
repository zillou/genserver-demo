defmodule Sequence.Cache do
  use Ecto.Schema
  import Ecto.Changeset

  schema "caches" do
    field :module, :string
    field :cached_state, :binary

    timestamps()
  end

  def changeset(cache, attrs) do
    cache
    |> cast(attrs, [:module, :cached_state])
  end

  def get_cache(module) do
    Sequence.Repo.get_by(__MODULE__, module: inspect(module))
  end

  def get_cached_state(module) do
    case get_cache(module) do
      %{cached_state: state} ->
        :erlang.binary_to_term(state)
      _ ->
        nil
    end
  end

  def cache_state(module, state) do
    case get_cache(module) do
      nil ->
        create_cache(module, state)
      cache ->
        update_cache(cache, state)
    end
  end

  def create_cache(module, state) do
    %__MODULE__{}
    |> changeset(%{module: inspect(module), cached_state: :erlang.term_to_binary(state)})
    |> Sequence.Repo.insert()
  end

  def update_cache(cache, state) do
    cache
    |> changeset(%{cached_state: :erlang.term_to_binary(state)})
    |> Sequence.Repo.update()
  end
end
