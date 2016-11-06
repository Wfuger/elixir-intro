# defmodule creates a module called Cards
# Module is a collection of methods or functions
defmodule Cards do
  # def creates a new function
  # No return needed elixir has implicit return
  def create_deck do
    # Convential to use double quotes everywhere
    # Square brackets create a list
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    """
    List comprehension is a mapping function ie returns a new array
    Runs multiple list comprehensions at same time and returns into 1 array
    Nesting comprehensions return nested arrays
    """
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    # Arity or the number of arguments a functions accepts
    # Arity of one
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # Methods can have question mark to denote a boolean return
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # Returns a tuple {[hand],[rest of the deck]}
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    # Calling an Erlang method to save to file system
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # case statements similar to switch
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _reason } -> "That file does not exist"
    end

  end

  def create_hand(hand_size) do

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
