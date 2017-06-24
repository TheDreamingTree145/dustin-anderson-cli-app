require "./lib/app/version"

module DustinAndersonCLIApp
  class Movie
    attr_accessor :rank, :title, :rating, :reviews, :consensus
    @@all = []

    def initialize(rank = nil, title = nil, rating = nil, reviews = nil, consensus = nil)
      @rank = rank
      @title = title
      @rating = rating
      @reviews = reviews
      @consensus = consensus
      @@all << self
    end

end
