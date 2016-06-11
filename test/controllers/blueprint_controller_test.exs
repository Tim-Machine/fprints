defmodule Fprints.BlueprintControllerTest do
  use Fprints.ConnCase

  alias Fprints.Blueprint
  @valid_attrs %{description: "some content", image: "some content", parsed: "some content", raw: "some content", requirements: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, blueprint_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing blueprints"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, blueprint_path(conn, :new)
    assert html_response(conn, 200) =~ "New blueprint"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, blueprint_path(conn, :create), blueprint: @valid_attrs
    assert redirected_to(conn) == blueprint_path(conn, :index)
    assert Repo.get_by(Blueprint, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, blueprint_path(conn, :create), blueprint: @invalid_attrs
    assert html_response(conn, 200) =~ "New blueprint"
  end

  test "shows chosen resource", %{conn: conn} do
    blueprint = Repo.insert! %Blueprint{}
    conn = get conn, blueprint_path(conn, :show, blueprint)
    assert html_response(conn, 200) =~ "Show blueprint"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, blueprint_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    blueprint = Repo.insert! %Blueprint{}
    conn = get conn, blueprint_path(conn, :edit, blueprint)
    assert html_response(conn, 200) =~ "Edit blueprint"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    blueprint = Repo.insert! %Blueprint{}
    conn = put conn, blueprint_path(conn, :update, blueprint), blueprint: @valid_attrs
    assert redirected_to(conn) == blueprint_path(conn, :show, blueprint)
    assert Repo.get_by(Blueprint, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    blueprint = Repo.insert! %Blueprint{}
    conn = put conn, blueprint_path(conn, :update, blueprint), blueprint: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit blueprint"
  end

  test "deletes chosen resource", %{conn: conn} do
    blueprint = Repo.insert! %Blueprint{}
    conn = delete conn, blueprint_path(conn, :delete, blueprint)
    assert redirected_to(conn) == blueprint_path(conn, :index)
    refute Repo.get(Blueprint, blueprint.id)
  end
end
