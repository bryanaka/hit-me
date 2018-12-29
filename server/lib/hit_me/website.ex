defmodule HitMe.Website do
  use Ecto.Schema
  import Ecto.Changeset


  schema "websites" do
    field :host, :string
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(website, attrs) do
    website
    |> cast(attrs, [:name, :host])
    |> validate_required([:name, :host])
  end
end
