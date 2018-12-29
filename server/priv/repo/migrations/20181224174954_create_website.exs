defmodule HitMe.Repo.Migrations.CreateWebsite do
  use Ecto.Migration

  def change do
    create table(:website) do
      add :name, :string
      add :host, :string
      add :token, :string

      timestamps()
    end

    create unique_index(:website, [:host])
  end
end
