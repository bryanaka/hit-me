defmodule HitMe.Repo.Migrations.CreateMilestones do
  use Ecto.Migration

  def change do
    create table(:milestones) do

      timestamps()
    end

  end
end
