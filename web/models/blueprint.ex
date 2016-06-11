defmodule Fprints.Blueprint do
  use Fprints.Web, :model

  schema "blueprints" do
    field :title, :string
    field :image, :string
    field :raw, :string
    field :description, :string
    field :requirements, :string
    field :parsed, :string
    belongs_to :user, Fprints.User

    timestamps
  end

  @required_fields ~w(title image raw description requirements parsed)
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
