defmodule HitMe.Repo.Migrations.CreatePage do
  use Ecto.Migration

  def change do
    create table(:page) do
      add :path, :string
      add :hit_count, :integer
      add :website_id, references(:websites, on_delete: :nothing)

      timestamps()
    end

    create index(:page, [:website_id])
  end
end
