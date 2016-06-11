defmodule Fprints.FactorioVersion do
  use Fprints.Web, :model

  schema "factorio_versions" do
    field :version_number, :string

    timestamps
  end

  @required_fields ~w(version_number)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
