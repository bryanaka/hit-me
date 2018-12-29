defmodule HitMe.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :path, :string
      add :hit_count, :integer
      add :website_id, references(:websites, on_delete: :nothing)

      timestamps()
    end

    create index(:pages, [:website_id])
  end
end
