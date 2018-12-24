defmodule HitMe.Milestone do
  use Ecto.Schema
  import Ecto.Changeset


  schema "milestone" do
    field :code, :string
    field :description, :string
    field :hit_count, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(milestone, attrs) do
    milestone
    |> cast(attrs, [:hit_count, :code, :name, :description])
    |> validate_required([:hit_count, :code, :name, :description])
  end
end
