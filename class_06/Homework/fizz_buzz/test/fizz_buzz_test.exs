defmodule FizzBuzzTest do
  use ExUnit.Case

  @fizzbuzzes [15, 30, 45, 60, 75, 90]     # atributos de modulo a nivel global, inicializa con lista
  @fizzes Enum.map(1..33, fn n -> n * 3 end) -- @fizzbuzzes # mapa, recibe un enumerable y le pasan un rango 1..33, desp una funcion anonima, toma 1 * 3..
  @buzzes Enum.map(1..20, fn n -> n * 5 end) -- @fizzbuzzes # mapa, recibe un enumerable y le pasan un rango 1..20, desp una funcion anonima, toma 1 * 5..
  @others (((Enum.to_list(1..100) -- @fizzbuzzes) -- @fizzes) -- @buzzes)


  Enum.each(@fizzbuzzes, fn n ->    # each es una funcion, def modulo es una macro
    @num n
    test "#{@num} should give fizzbuzz" do
      assert FizzBuzz.calculate_multiple(@num) == "fizzbuzz"
    end
  end)

  Enum.each(@fizzes, fn n ->
    @num n
    test "#{@num} should give fizz" do
      assert FizzBuzz.calculate_multiple(@num) == "fizz"
    end
  end)

  Enum.each(@buzzes, fn n ->
    @num n
    test "#{@num} should give buzz" do
      assert FizzBuzz.calculate_multiple(@num) == "buzz"
    end
  end)

  Enum.each(@others, fn n ->
    @num n
    test "#{@num} should give other" do
      assert FizzBuzz.calculate_multiple(@num) == Integer.to_string(@num)
    end
  end)



end
