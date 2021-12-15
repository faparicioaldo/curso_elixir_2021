defmodule Phoenix101BunsanWeb.PetView do
  use Phoenix101BunsanWeb, :view
  alias Phoenix101BunsanWeb.PetView

  def render("index.json", %{pets: pets}) do
    %{data: render_many(pets, PetView, "pet.json")}
  end

  def render("show.json", %{pet: pet}) do
    %{data: render_one(pet, PetView, "pet.json")}
  end

  def render("pet.json", %{pet: pet}) do
    %{
      id: pet.id,
      name: pet.name,
      age: pet.age,
      type: pet.type,
      size: pet.size
    }
  end
end
