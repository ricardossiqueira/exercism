defmodule NameBadge do
  def print(id, name, department),
    do:
      if(id != nil, do: "[#{to_string(id)}] - ", else: "") <>
        name <>
        if(department != nil, do: " - #{:string.uppercase(department)}", else: " - OWNER")
end
