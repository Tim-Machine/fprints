defmodule Fprints.Repo.Migrations.CreateBlueprintTag do
  use Ecto.Migration

  def change do
    create table(:blueprint_tags) do
      add :tag, :string

      timestamps
    end

  end
end
