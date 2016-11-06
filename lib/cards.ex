# defmodule creates a module called Cards
# Module is a collection of methods or functions
defmodule Cards do
  # def creates a new function
  # No return needed elixir has implicit return
  def create_deck do
    # Convential to use double quotes everywhere
    # Square brackets create a list
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    # Arity or the number of arguments a functions accepts
    # Arity of one
    Enum.shuffle(deck)
  end
  
end
