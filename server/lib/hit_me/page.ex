defmodule HitMe.Page do
  use Ecto.Schema
  import Ecto.Changeset


  schema "page" do
    field :hit_count, :integer
    field :path, :string
    field :website_id, :id

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:path, :hit_count])
    |> validate_required([:path, :hit_count])
  end
end
