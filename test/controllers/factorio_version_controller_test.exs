defmodule Fprints.FactorioVersionControllerTest do
  use Fprints.ConnCase

  alias Fprints.FactorioVersion
  @valid_attrs %{version_number: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, factorio_version_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing factorio versions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, factorio_version_path(conn, :new)
    assert html_response(conn, 200) =~ "New factorio version"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, factorio_version_path(conn, :create), factorio_version: @valid_attrs
    assert redirected_to(conn) == factorio_version_path(conn, :index)
    assert Repo.get_by(FactorioVersion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, factorio_version_path(conn, :create), factorio_version: @invalid_attrs
    assert html_response(conn, 200) =~ "New factorio version"
  end

  test "shows chosen resource", %{conn: conn} do
    factorio_version = Repo.insert! %FactorioVersion{}
    conn = get conn, factorio_version_path(conn, :show, factorio_version)
    assert html_response(conn, 200) =~ "Show factorio version"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, factorio_version_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    factorio_version = Repo.insert! %FactorioVersion{}
    conn = get conn, factorio_version_path(conn, :edit, factorio_version)
    assert html_response(conn, 200) =~ "Edit factorio version"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    factorio_version = Repo.insert! %FactorioVersion{}
    conn = put conn, factorio_version_path(conn, :update, factorio_version), factorio_version: @valid_attrs
    assert redirected_to(conn) == factorio_version_path(conn, :show, factorio_version)
    assert Repo.get_by(FactorioVersion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    factorio_version = Repo.insert! %FactorioVersion{}
    conn = put conn, factorio_version_path(conn, :update, factorio_version), factorio_version: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit factorio version"
  end

  test "deletes chosen resource", %{conn: conn} do
    factorio_version = Repo.insert! %FactorioVersion{}
    conn = delete conn, factorio_version_path(conn, :delete, factorio_version)
    assert redirected_to(conn) == factorio_version_path(conn, :index)
    refute Repo.get(FactorioVersion, factorio_version.id)
  end
end
