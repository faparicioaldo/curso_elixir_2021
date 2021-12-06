defmodule FizzBuzz do

  def calculate_multiple(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "fizzbuzz"
      {0, _} -> "fizz"
      {_, 0} -> "buzz"
      _      -> Integer.to_string(n)
    end
  end
end
