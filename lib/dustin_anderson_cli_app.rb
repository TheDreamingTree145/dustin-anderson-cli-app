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

    def self.all
      @@all
    end

    def movie_consensus
      puts "Please enter the rank of the move you would like the critics consensus of: "
      consensus_input = gets.chomp
      if consensus_input.to_i >= 1 && consensus_input.to_i <= 100
        self.all.each do |film|
          if film.rank == consensus
            puts film.consensus # undefined currently
          end
        end
      end
    end

  end
end
