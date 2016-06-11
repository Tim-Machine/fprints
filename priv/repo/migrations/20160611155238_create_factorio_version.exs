defmodule Fprints.Repo.Migrations.CreateFactorioVersion do
  use Ecto.Migration

  def change do
    create table(:factorio_versions) do
      add :version_number, :string

      timestamps
    end

  end
end
