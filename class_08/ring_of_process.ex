defmodule ProcessRing do

  def start(nodes, rounds, message) do
    init_pid = spawn(__MODULE__, :loop, [{rounds, :default_next}])
    IO.inspect("PID #{inspect init_pid}, status alive: #{Process.alive?(init_pid)}", label: "PROCESS CREATED")
    create_nodes(nodes - 1, rounds, init_pid, init_pid)
    send(init_pid, {message})
  end

  def loop(state) do
    new_state =
      receive do
        {message} -> 
          current_round = elem(state, 0)
          next_pid = elem(state, 1)
          IO.inspect("It's PID: #{inspect self}, next_pid: #{inspect next_pid}, on round: #{current_round}, msj: #{message}")
          send(next_pid, {message})          
          new_round = current_round - 1
          if new_round == 0 do
            IO.inspect("It's PID: #{inspect self}, I am dying...")
            Process.exit(self, :kill)
          end
          {new_round, next_pid}
        {:def_next_pid, next_pid} -> 
          {elem(state, 0), next_pid}          
      end
    loop(new_state)
  end

  def create_nodes(0, _, last_pid, init_pid) do 
    IO.inspect("Process ring created!!")
    send(init_pid, {:def_next_pid, last_pid})
  end

  def create_nodes(nodes, rounds, next_pid, init_pid) do
    last_pid = spawn(__MODULE__, :loop, [{rounds, next_pid}])
    IO.inspect("PID #{inspect last_pid}, status alive: #{Process.alive?(last_pid)}", label: "PROCESS CREATED")
    create_nodes(nodes - 1, rounds, last_pid, init_pid)
  end 
end
