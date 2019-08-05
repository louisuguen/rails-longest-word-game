require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }.join(" ")
  end

  def score
    @word = params[:word]
    response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @result = json['found']
  end
end
