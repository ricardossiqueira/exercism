defmodule Username do
  def sanitize([]), do: []

  def sanitize([h | t]) do
    case h do
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      c when c in ?a..?z -> [c]
      _ -> ''
    end ++ sanitize(t)
  end
end
