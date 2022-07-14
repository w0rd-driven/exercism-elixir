defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    @doc "Character consuming the item, give the effects"
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_item, character) do
      {nil, %{character | health: character.health + 5}}
    end
  end
end
