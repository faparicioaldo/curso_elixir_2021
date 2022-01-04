defmodule Mix.Tasks.GetFollowersTask do

  use Mix.Task

  def run(_) do 
    IO.puts "Hi, from a task!" 
    #TwitterApiClient.getIdByUsername(user1: "AldoTest1", user2: "AldoTest3")
    TwitterApiClient.getIdByUsername(user1: "hiphoox", user2: "chochosmx")
#    |>TwitterApiClient.getTwitterFollowers
  end
end
