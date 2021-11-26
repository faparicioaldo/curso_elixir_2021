names_list = ["Alma","Juan","Aldo","Mariano"]
IO.inspect(names_list, label: :INPUT)
result = Enum.map(names_list, fn name -> String.reverse(name) end)
IO.inspect(result, label: :OUTPUT)


