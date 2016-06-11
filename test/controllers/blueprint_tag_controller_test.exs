defmodule Fprints.BlueprintTagControllerTest do
  use Fprints.ConnCase

  alias Fprints.BlueprintTag
  @valid_attrs %{tag: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, blueprint_tag_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing blueprint tags"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, blueprint_tag_path(conn, :new)
    assert html_response(conn, 200) =~ "New blueprint tag"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, blueprint_tag_path(conn, :create), blueprint_tag: @valid_attrs
    assert redirected_to(conn) == blueprint_tag_path(conn, :index)
    assert Repo.get_by(BlueprintTag, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, blueprint_tag_path(conn, :create), blueprint_tag: @invalid_attrs
    assert html_response(conn, 200) =~ "New blueprint tag"
  end

  test "shows chosen resource", %{conn: conn} do
    blueprint_tag = Repo.insert! %BlueprintTag{}
    conn = get conn, blueprint_tag_path(conn, :show, blueprint_tag)
    assert html_response(conn, 200) =~ "Show blueprint tag"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, blueprint_tag_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    blueprint_tag = Repo.insert! %BlueprintTag{}
    conn = get conn, blueprint_tag_path(conn, :edit, blueprint_tag)
    assert html_response(conn, 200) =~ "Edit blueprint tag"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    blueprint_tag = Repo.insert! %BlueprintTag{}
    conn = put conn, blueprint_tag_path(conn, :update, blueprint_tag), blueprint_tag: @valid_attrs
    assert redirected_to(conn) == blueprint_tag_path(conn, :show, blueprint_tag)
    assert Repo.get_by(BlueprintTag, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    blueprint_tag = Repo.insert! %BlueprintTag{}
    conn = put conn, blueprint_tag_path(conn, :update, blueprint_tag), blueprint_tag: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit blueprint tag"
  end

  test "deletes chosen resource", %{conn: conn} do
    blueprint_tag = Repo.insert! %BlueprintTag{}
    conn = delete conn, blueprint_tag_path(conn, :delete, blueprint_tag)
    assert redirected_to(conn) == blueprint_tag_path(conn, :index)
    refute Repo.get(BlueprintTag, blueprint_tag.id)
  end
end
