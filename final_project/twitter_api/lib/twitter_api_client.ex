defmodule TwitterApiClient do 

  def calculateCommonFriends(users \\ []) do
    url = "https://api.twitter.com/2/users/by?usernames=#{"#{users[:user1]},#{users[:user2]}"}"
    request(url)
    |> extractIdsAsList
    |> getCommonFriendsByUserIds
    |> IO.inspect(label: "COMMON FRIENDS")
  end

  def getCommonFriendsByUserIds(ids_list) do
    map_graph = Map.new 
    id1 = Enum.at(ids_list, 0)
    id2 = Enum.at(ids_list, 1)
    
    user1_followers = getFollowersFromAPI(id1)
    IO.inspect(Enum.count(user1_followers), lebel: "#FOLLOWERS #{id1}")

    user2_followers = getFollowersFromAPI(id2)
    IO.inspect(Enum.count(user2_followers), lebel: "#FOLLOWERS #{id2}")
    user1_followers = getFollowingFromAPI(id1)
    user2_followers = getFollowingFromAPI(id2)
    
    common_followers = Set.intersection(Enum.into(user1_followers, HashSet.new), Enum.into(user2_followers, HashSet.new)) |> Set.to_list
    
    user1_followings = getFollowingFromAPI(id1)
    IO.inspect(Enum.count(user1_followings), lebel: "#FOLLOWINGS #{id1}")
    user2_followings = getFollowingFromAPI(id2)
    IO.inspect(Enum.count(user2_followings), lebel: "#FOLLOWINGS #{id2}")

    u1_real_friends = Set.intersection(Enum.into(common_followers, HashSet.new), Enum.into(user1_followings, HashSet.new)) |> Set.to_list
    u2_real_friends = Set.intersection(Enum.into(common_followers, HashSet.new), Enum.into(user2_followings, HashSet.new)) |> Set.to_list

    common_real_friends = Set.intersection(Enum.into(u1_real_friends, HashSet.new), Enum.into(u2_real_friends, HashSet.new)) |> Set.to_list
  end
  
  def extractIdsAsList(response_data) do
    extractDataIfOk(response_data).body
    |> parse_body_to_tuple
    |> extractDataIfOk
    |> Map.get("data")
    |> Enum.reduce([], fn curr_list, acc_list -> [ Map.get(curr_list, "id") | acc_list ] end)
  end

  def extractUsernamesAsList(response_data) do
    extractDataIfOk(response_data).body
    |> parse_body_to_tuple
    |> extractDataIfOk
    |> Map.get("data")
    |> Enum.reduce([], fn curr_list, acc_list -> [ Map.get(curr_list, "username") | acc_list ] end)
  end

  def extractDataIfOk(data) do
    case data do
      {:ok, response} -> 
        response
    end
  end

  defp request(url) do
    HTTPoison.start
    token = "AAAAAAAAAAAAAAAAAAAAAEFYXgEAAAAAy2jWNFbEQiB%2BlI2cmB0oB709HqE%3DPRbcaa09XBvjDmXNPS9E80Clqn2ahcGsPWpujSGSCZJSGIkzDJ"
    headers = ["Authorization": "Bearer #{token}", "Accept": "application/json; charset=utf-8"]
    HTTPoison.get(url, headers)
  end

  defp body(response) do
    response.body
  end

  defp parse_body_to_tuple(body) do
    Poison.Parser.parse body
  end

  defp get_list_per_tuple(tuple) do
    elem(tuple, 1)
  end

  defp get_map_to_list(map) do
    map 
    |> Enum.at(0)
  end

  defp create_message(map) do 
    "Title: >>> #{map["name"]} #{map["title"]} <<<, its URL: #{map["url"]}"
  end

  defp log(message, tag) do
    IO.inspect(message, lebel: tag)
  end
  
  def getFollowersFromAPI(user_id) do
    request("https://api.twitter.com/2/users/#{user_id}/followers")
    |> extractUsernamesAsList
  end

  def getFollowingFromAPI(user_id) do
    request("https://api.twitter.com/2/users/#{user_id}/following")
    |> extractUsernamesAsList
  end
end
