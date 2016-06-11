defmodule Fprints.FactorioVersionController do
  use Fprints.Web, :controller

  alias Fprints.FactorioVersion

  plug :scrub_params, "factorio_version" when action in [:create, :update]

  def index(conn, _params) do
    factorio_versions = Repo.all(FactorioVersion)
    render(conn, "index.html", factorio_versions: factorio_versions)
  end

  def new(conn, _params) do
    changeset = FactorioVersion.changeset(%FactorioVersion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"factorio_version" => factorio_version_params}) do
    changeset = FactorioVersion.changeset(%FactorioVersion{}, factorio_version_params)

    case Repo.insert(changeset) do
      {:ok, _factorio_version} ->
        conn
        |> put_flash(:info, "Factorio version created successfully.")
        |> redirect(to: factorio_version_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    factorio_version = Repo.get!(FactorioVersion, id)
    render(conn, "show.html", factorio_version: factorio_version)
  end

  def edit(conn, %{"id" => id}) do
    factorio_version = Repo.get!(FactorioVersion, id)
    changeset = FactorioVersion.changeset(factorio_version)
    render(conn, "edit.html", factorio_version: factorio_version, changeset: changeset)
  end

  def update(conn, %{"id" => id, "factorio_version" => factorio_version_params}) do
    factorio_version = Repo.get!(FactorioVersion, id)
    changeset = FactorioVersion.changeset(factorio_version, factorio_version_params)

    case Repo.update(changeset) do
      {:ok, factorio_version} ->
        conn
        |> put_flash(:info, "Factorio version updated successfully.")
        |> redirect(to: factorio_version_path(conn, :show, factorio_version))
      {:error, changeset} ->
        render(conn, "edit.html", factorio_version: factorio_version, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    factorio_version = Repo.get!(FactorioVersion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(factorio_version)

    conn
    |> put_flash(:info, "Factorio version deleted successfully.")
    |> redirect(to: factorio_version_path(conn, :index))
  end
end
