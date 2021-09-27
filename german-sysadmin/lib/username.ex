defmodule Username do
  def sanitize('') do
    ''
  end

  def sanitize(username) do
    [head | tail] = username
    case head do
      head when head >= 0x0061 and head <= 0x0007A -> [head | sanitize(tail)]
      head when head == 0x005F -> [head | sanitize(tail)]
      head when head == ?ä -> String.to_charlist("ae") ++ sanitize(tail)
      head when head == ?ö -> String.to_charlist("oe") ++ sanitize(tail)
      head when head == ?ü -> String.to_charlist("ue") ++ sanitize(tail)
      head when head == ?ß -> String.to_charlist("ss") ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end
