defmodule Elixir101BunsanTest do
  use ExUnit.Case
  doctest Elixir101Bunsan

  test "greets the world" do
    assert Elixir101Bunsan.hello() == :world
  end
end
