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

  test "a duplicate letter is reported" do
    game = Game.new_game
    {game, _tally} = Game.make_move(game, "x")
    assert game.state != :already_used
    {game, _tally} = Game.make_move(game, "c")
    assert game.state != :already_used
    {game, _tally} = Game.make_move(game, "c")
    assert game.state == :already_used
  end

  test "we record letters" do
    game = Game.new_game
    {game, _tally} = Game.make_move(game, "c")
    {game, _tally} = Game.make_move(game, "x")
    assert MapSet.equal?(game.used, MapSet.new(["c", "x"]))
  end

  test "game state doesnt change if won or lost" do
    for state <- [:won, :lost] do
      game = Game.new_game("okie")
      game = Map.put(game, :state, state)
      {new_game, _tally} = Game.make_move(game, "x")
      assert new_game == game
    end
  end
end
