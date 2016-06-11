defmodule Fprints.BlueprintTest do
  use Fprints.ModelCase

  alias Fprints.Blueprint

  @valid_attrs %{blueprint_string: "some content", description: "some content", image: "some content", json: "some content", requirements: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Blueprint.changeset(%Blueprint{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Blueprint.changeset(%Blueprint{}, @invalid_attrs)
    refute changeset.valid?
  end
end
