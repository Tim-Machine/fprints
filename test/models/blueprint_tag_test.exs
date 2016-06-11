defmodule Fprints.BlueprintTagTest do
  use Fprints.ModelCase

  alias Fprints.BlueprintTag

  @valid_attrs %{tag: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BlueprintTag.changeset(%BlueprintTag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BlueprintTag.changeset(%BlueprintTag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
