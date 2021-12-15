defmodule Phoenix101Bunsan.Pets.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :age, :integer
    field :name, :string
    field :size, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :age, :type, :size])
    |> validate_required([:name, :age, :type, :size])
  end
end
