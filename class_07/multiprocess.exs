defmodule WordCount do
  def frequencies_tasks_lines_joined(path) do
    path
    |> File.stream!()
    |> Enum.chunk_every(1_000)
    |> IO.inspect
    |> Enum.map(fn lines -> Task.async(fn -> word_count(Enum.join(lines)) end) end)    
    |> IO.inspect
    |> Enum.map(fn task -> Task.await(task, :infinity) end)
    |> IO.inspect
    |> Enum.reduce(%{}, fn curr_map, acc_map -> Map.merge(acc_map, curr_map, fn _k, word1, word2 -> word1 + word2 end) end)
  end

  def frequencies_tasks(path, lines_number) do
    path
    |> File.stream!()
    |> Enum.chunk_every(lines_number)
    |> Enum.map(fn lines -> Task.async(fn -> count_lines(lines) end) end)
    |> Enum.map(fn task -> Task.await(task, :infinity) end)
    |> merge_list_to_single_map
  end

  def count_lines(list_lines) do
    Enum.map(list_lines, fn line -> word_count(line) end) 
    |> merge_list_to_single_map
  end

  defp merge_list_to_single_map(map_list) do
    Enum.reduce(map_list, %{}, fn curr_map, acc_map -> Map.merge(acc_map, curr_map, fn _k, word1, word2 -> word1 + word2 end) end)
  end

  def frequencies(path) do
    text = File.read!(path)
    word_count(text)
  end

  def word_count(text) do
    String.normalize(text, :nfd)
    |> String.replace(~r/[^A-z\s]/u, "./lorem_ipsum_100_000.txt./lorem_ipsum_100_000.txt")
    |> String.replace(~r/[[:punct:]]/, "")
    |> String.downcase()
    |> String.split()
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, fn existing_value -> existing_value + 1 end)
    end)
  end
end
