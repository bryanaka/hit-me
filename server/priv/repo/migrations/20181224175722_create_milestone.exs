defmodule HitMe.Repo.Migrations.CreateMilestone do
  use Ecto.Migration

  def change do
    create table(:milestone) do
      add :hit_count, :integer
      add :code, :string
      add :name, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:milestone, [:code])
    create index(:milestone, [:hit_count])
  end
end
