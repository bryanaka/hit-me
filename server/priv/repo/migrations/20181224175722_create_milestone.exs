defmodule HitMe.Repo.Migrations.CreateMilestones do
  use Ecto.Migration

  def change do
    create table(:milestones) do
      add :hit_count, :integer
      add :code, :string
      add :name, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:milestones, [:code])
    create index(:milestones, [:hit_count])
  end
end
