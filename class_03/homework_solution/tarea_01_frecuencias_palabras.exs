defmodule Custom do
  def frequencies(phrase) do
    phrase
    |> IO.inspect(label: :INPUT)
    |> String.split()
    |> Enum.reduce(%{}, fn word, acc_map -> Map.update(acc_map, word, 1, &(&1 + 1)) end)
    |> IO.inspect(label: :OUTPUT)
  end
end

phrase = "a los bunsancitos les gusta programar con otros bunsancitos y jugar con mas bunsancitos y con sus mascotas" 
Custom.frequencies(phrase)

"""
STEPS:
In this case we use next:
  1. capture operator used to 
      * convert function to anonimous function
      * create short anonimous function &(&1 + 1) -> equivalent to "fn occurrences -> occurrences + 1 end"
      * it need at least one parameter
      * &1 is called value plcaeholder (marcador de posicion) and identifies the first argument
      * &[&1, &2] -> return list 
      * &{&1, &2} -> return tuple 
    2. Map.update/4: update occurrences initialize in 1, in next occurrences add 1 
    3. Enum.reduce/3: reduce a list of arguments to just one applying an function, first param y defined by pipeline operator
    4. |> pipeline operator, previous expression indicates first parameter of the following expression, it only remains to indicate the rest of the parameters

    Enum.map(["juan","pedron","mar"], &String.length/1)
    Map.new([{:a, 1},{:b, 2}])
    Enum.reduce(["ali","juan","gguillermina"], %{}, fn name, mapa -> Map.put(mapa, name, String.length(name))  end)

References
    > https://dockyard.com/blog/2016/08/05/understand-capture-operator-in-elixir

"""


