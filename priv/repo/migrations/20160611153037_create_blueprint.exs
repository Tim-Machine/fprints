defmodule Fprints.Repo.Migrations.CreateBlueprint do
  use Ecto.Migration

  def change do
    create table(:blueprints) do
      add :title, :string
      add :image, :string
      add :blueprint_string, :string
      add :description, :string
      add :requirements, :string
      add :json, :string
      add :factorio_version_id, references(:factorio_versions, on_delete: :nothing)

      timestamps
    end
    create index(:blueprints, [:factorio_version_id])

  end
end
