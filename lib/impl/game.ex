defmodule Hangman.Impl.Game do
 alias Hangman.Types
  @type t :: %__MODULE__{
          turns_left: integer,
          state: Types.state(),
          letters: list(String.t()),
          used: MapSet.t(String.t())
        }
  defstruct(
    turns_left: 7,
    state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  @spec new_game :: t
  def new_game do
    %Hangman.Impl.Game{
      letters: Dictionary.random_word() |> String.codepoints()
    }
  end

  @spec new_game(String.t) :: t
  def new_game(word) do
    %Hangman.Impl.Game{
      letters: word |> String.codepoints()
    }
  end
end
