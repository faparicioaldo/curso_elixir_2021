
#list_data = ["311723","2","2021-10-22","30001","0","0","0","0","0","1","S","1900-01-01"]

#Enum.split(list_data)
#Enum.sort_by

IO.inspect("Enum.all? -> VALIDATE MALICIOUS CODE IF CONTAINS function or alert KEYWORDS", label: :EXERCISE_3)
user_data = ["Juan","Perez","function","alert(1)","Mario"]
IO.inspect(user_data, label: :INPUT)
result = Enum.all?(user_data, fn data -> String.contains?(data, ["function","alert(1)"]) end)
IO.inspect("String is safe: #{result}", label: :OUTPUT)

user_data_2 = ["Juan","Perez","Married","21 years","Mario"]
IO.inspect(user_data_2, label: :INPUT)
result_2 = Enum.all?(user_data_2, fn data_2 -> !String.contains?(data_2, ["function","alert(1)"]) end)
IO.inspect("String is safe: #{result_2}", label: :OUTPUT)

#Enum.zip
#Enum.zip_with

