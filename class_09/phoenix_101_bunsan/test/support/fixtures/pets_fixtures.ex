defmodule Phoenix101Bunsan.PetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Phoenix101Bunsan.Pets` context.
  """

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    {:ok, pet} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name",
        size: "some size",
        type: "some type"
      })
      |> Phoenix101Bunsan.Pets.create_pet()

    pet
  end
end
