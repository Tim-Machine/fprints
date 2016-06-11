defmodule Fprints.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :user_name, :string
      add :avatar, :string

      timestamps
    end

  end
end
