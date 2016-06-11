defmodule Fprints.FactorioVersionTest do
  use Fprints.ModelCase

  alias Fprints.FactorioVersion

  @valid_attrs %{version_number: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FactorioVersion.changeset(%FactorioVersion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FactorioVersion.changeset(%FactorioVersion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
