require 'net/http'
require 'json'

class GamesController < ApplicationController

  def new
    # @letters= Array('a'..'z').sample(10, replace: true)
    # @letters = ('a'..'z').to_a.sample(10)
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    #empty
    #raise
    @word = params[:word].downcase
    @letters = params[:letters].downcase
    #raise
    if can_be_built_from_grid?(@word, @letters)
      if valid_english_word?(@word)
        @result = "Congratulations! '#{@word}' is a valid word. ✅"
      else
        @result = "The word is valid according to the grid but is not a valid English word ❌"
      end
    else
      @result = "The word can't be built out of the original grid ❌"
    end
    #raise
  end

  private

  def can_be_built_from_grid?(word, letters)
    word.chars.all? { |char| word.count(char) <= letters.count(char) }
  end

  def valid_english_word?(word)
    # Placeholder: Replace this with a real dictionary check
    url = "https://dictionary.lewagon.com/#{word}"
    uri = URI(url)
    response = Net::HTTP.get(uri) # Perform the GET request
    json = JSON.parse(response)   # Parse the response as JSON
    json["found"]
  end
end
