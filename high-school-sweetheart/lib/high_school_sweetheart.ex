defmodule HighSchoolSweetheart do
  @spec first_letter(any) :: any
  def first_letter(name) do
    String.trim(name) |> String.first()
  end

  @spec initial(binary) :: binary
  def initial(name) do
    first_letter(name) <> "." |> String.upcase()
  end

  @spec initials(binary) :: binary
  def initials(full_name) do
    String.split(full_name, " ", trim: true) |> Enum.map(fn word ->
      initial(word) <> " "
    end) |> List.to_string() |> String.trim()
  end

  @spec pair(binary, binary) :: <<_::64, _::_*8>>
  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
