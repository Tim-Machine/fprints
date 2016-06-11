defmodule Fprints.BlueprintController do
  use Fprints.Web, :controller

  alias Fprints.Blueprint

  plug :scrub_params, "blueprint" when action in [:create, :update]

  def index(conn, _params) do
    blueprints = Repo.all(Blueprint)
    render(conn, "index.html", blueprints: blueprints)
  end

  def new(conn, _params) do
    changeset = Blueprint.changeset(%Blueprint{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blueprint" => blueprint_params}) do
    changeset = Blueprint.changeset(%Blueprint{}, blueprint_params)

    case Repo.insert(changeset) do
      {:ok, _blueprint} ->
        conn
        |> put_flash(:info, "Blueprint created successfully.")
        |> redirect(to: blueprint_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blueprint = Repo.get!(Blueprint, id)
    render(conn, "show.html", blueprint: blueprint)
  end

  def edit(conn, %{"id" => id}) do
    blueprint = Repo.get!(Blueprint, id)
    changeset = Blueprint.changeset(blueprint)
    render(conn, "edit.html", blueprint: blueprint, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blueprint" => blueprint_params}) do
    blueprint = Repo.get!(Blueprint, id)
    changeset = Blueprint.changeset(blueprint, blueprint_params)

    case Repo.update(changeset) do
      {:ok, blueprint} ->
        conn
        |> put_flash(:info, "Blueprint updated successfully.")
        |> redirect(to: blueprint_path(conn, :show, blueprint))
      {:error, changeset} ->
        render(conn, "edit.html", blueprint: blueprint, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blueprint = Repo.get!(Blueprint, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(blueprint)

    conn
    |> put_flash(:info, "Blueprint deleted successfully.")
    |> redirect(to: blueprint_path(conn, :index))
  end
end
