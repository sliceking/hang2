defmodule HangmanImplGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new game returns correct structure" do
    game = Game.new_game() 
    assert length(game.letters) > 0 
    assert game.state == :initializing
    assert game.turns_left == 7
  end

  test "new game returns correct word" do
    game = Game.new_game("bomb")
    assert game.letters == ["b", "o", "m", "b"]
    assert game.state == :initializing
    assert game.turns_left == 7 
  end
end

