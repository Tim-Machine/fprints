defmodule Fprints.Blueprint do
  use Fprints.Web, :model

  schema "blueprints" do
    field :title, :string
    field :image, :string
    field :blueprint_string, :string
    field :description, :string
    field :requirements, :string
    field :json, :string
    belongs_to :factorio_version, Fprints.FactorioVersion

    timestamps
  end

  @required_fields ~w(title image blueprint_string description requirements json)
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
