defmodule Phoenix101Bunsan.PetsTest do
  use Phoenix101Bunsan.DataCase

  alias Phoenix101Bunsan.Pets

  describe "pets" do
    alias Phoenix101Bunsan.Pets.Pet

    import Phoenix101Bunsan.PetsFixtures

    @invalid_attrs %{age: nil, name: nil, size: nil, type: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Pets.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Pets.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{age: 42, name: "some name", size: "some size", type: "some type"}

      assert {:ok, %Pet{} = pet} = Pets.create_pet(valid_attrs)
      assert pet.age == 42
      assert pet.name == "some name"
      assert pet.size == "some size"
      assert pet.type == "some type"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{age: 43, name: "some updated name", size: "some updated size", type: "some updated type"}

      assert {:ok, %Pet{} = pet} = Pets.update_pet(pet, update_attrs)
      assert pet.age == 43
      assert pet.name == "some updated name"
      assert pet.size == "some updated size"
      assert pet.type == "some updated type"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_pet(pet, @invalid_attrs)
      assert pet == Pets.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Pets.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Pets.change_pet(pet)
    end
  end
end
