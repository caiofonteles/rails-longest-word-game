
class GamesController < ApplicationController

  def new
    @letters = [('a'..'z'), ('a'..'z'), ('a'..'z')].map(&:to_a).flatten.sample(10)
  end

  def score
    @word = params["word"]
    url = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    @hash_word = JSON.parse(url)

    if params[:letters].include?(@word.chars.join(" && ")) == false
      @result = "Sorry the test cann't be build out if #{params[:letters][1..-2]}"
    elsif @hash_word["found"]
      @result = "Congratulations!#{@word} is a valid English word!"
    else
      @result = "Sorry! #{@word} does not seem to be a valid English word!"
    end

  end
end
