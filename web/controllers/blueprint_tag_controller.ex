defmodule Fprints.BlueprintTagController do
  use Fprints.Web, :controller

  alias Fprints.BlueprintTag

  plug :scrub_params, "blueprint_tag" when action in [:create, :update]

  def index(conn, _params) do
    blueprint_tags = Repo.all(BlueprintTag)
    render(conn, "index.html", blueprint_tags: blueprint_tags)
  end

  def new(conn, _params) do
    changeset = BlueprintTag.changeset(%BlueprintTag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blueprint_tag" => blueprint_tag_params}) do
    changeset = BlueprintTag.changeset(%BlueprintTag{}, blueprint_tag_params)

    case Repo.insert(changeset) do
      {:ok, _blueprint_tag} ->
        conn
        |> put_flash(:info, "Blueprint tag created successfully.")
        |> redirect(to: blueprint_tag_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blueprint_tag = Repo.get!(BlueprintTag, id)
    render(conn, "show.html", blueprint_tag: blueprint_tag)
  end

  def edit(conn, %{"id" => id}) do
    blueprint_tag = Repo.get!(BlueprintTag, id)
    changeset = BlueprintTag.changeset(blueprint_tag)
    render(conn, "edit.html", blueprint_tag: blueprint_tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blueprint_tag" => blueprint_tag_params}) do
    blueprint_tag = Repo.get!(BlueprintTag, id)
    changeset = BlueprintTag.changeset(blueprint_tag, blueprint_tag_params)

    case Repo.update(changeset) do
      {:ok, blueprint_tag} ->
        conn
        |> put_flash(:info, "Blueprint tag updated successfully.")
        |> redirect(to: blueprint_tag_path(conn, :show, blueprint_tag))
      {:error, changeset} ->
        render(conn, "edit.html", blueprint_tag: blueprint_tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blueprint_tag = Repo.get!(BlueprintTag, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(blueprint_tag)

    conn
    |> put_flash(:info, "Blueprint tag deleted successfully.")
    |> redirect(to: blueprint_tag_path(conn, :index))
  end
end
