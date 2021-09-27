defmodule Username do
  def sanitize('') do
    ''
  end

  def sanitize(username) do
    [head | tail] = username
    case head do
      head when head >= 0x0061 and head <= 0x0007A -> [head | sanitize(tail)]
      _ -> sanitize(tail)
    end
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
  end
end
