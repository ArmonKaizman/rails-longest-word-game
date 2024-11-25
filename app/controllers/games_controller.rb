class GamesController < ApplicationController

  def new
    # @letters= Array('a'..'z').sample(10, replace: true)
    # @letters = ('a'..'z').to_a.sample(10)
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
  end
end
