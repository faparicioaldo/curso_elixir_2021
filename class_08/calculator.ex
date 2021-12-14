defmodule Calculator do

  def start() do
    spawn(__MODULE__, :loop, [0])
  end

  def loop(state) do
    new_state =
      receive do
        {:sum, x, from} ->
          sum = state + x
          send(from, sum)
          IO.inspect(sum)
          sum
        {:sub, x} ->
          sub = state - x
          IO.inspect(sub)
        {:mul, x} ->
          mul = state * x
          IO.inspect(mul)
        {:div, x} ->
          div = state / x
          IO.inspect(div)
      end
   loop(new_state)
  end
end
"""
programa revide 2 enteros y un mensaje 
construir un anillo de procesos
un proceso mensaje a otro y ultimo al primero 
1 er entero es num de procesos
2 do numero de vueltas q manda mensaje a todo el anillo
3 er elemento es el mensaje 


al terminar se mueren los procesos

imprimir en consola soy proceso tal recibi mensaje y contador de cuantas veces paso el mensaje 
"""',.mensaje'
