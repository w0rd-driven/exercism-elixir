defmodule RPG.CharacterSheet do
  @spec welcome :: :ok
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
    :ok
  end

  @spec ask_name :: String.t()
  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim()
  end

  @spec ask_class :: String.t()
  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim()
  end

  @spec ask_level :: integer()
  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim() |> String.to_integer()
  end

  @spec run :: %{class: String.t(), level: integer, name: String.t()}
  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    character = %{class: class, level: level, name: name}
    IO.inspect(character, label: "Your character")
    character
  end
end
