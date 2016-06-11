defmodule Fprints.Repo.Migrations.CreateBlueprint do
  use Ecto.Migration

  def change do
    create table(:blueprints) do
      add :title, :string
      add :image, :string
      add :raw, :string
      add :description, :text
      add :requirements, :text
      add :parsed, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:blueprints, [:user_id])

  end
end
