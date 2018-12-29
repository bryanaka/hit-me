defmodule HitMe.Repo.Migrations.CreateWebsites do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :name, :string
      add :host, :string
      add :token, :string

      timestamps()
    end

    create unique_index(:websites, [:host])
  end
end
