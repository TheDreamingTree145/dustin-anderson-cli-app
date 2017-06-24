require "./lib/app/version"

module DustinAndersonCLIApp
  class Movie
    attr_accessor :rank, :title, :rating, :reviews, :summary, :movie_scraper
    @@all = []

    def initialize(rank = nil, title = nil, rating = nil, reviews = nil, summary = nil)
      @rank = rank
      @title = title
      @rating = rating
      @reviews = reviews
      @summary = summary
      @@all << self
    end

    def self.all
      @@all
    end

    def self.movie_summary
      puts "Please enter the rank of the move you would like the critics summary of: "
      summary_input = gets.chomp
      if summary_input.to_i >= 1 && summary_input.to_i <= 100
        self.all.each do |film|
          if film.rank == summary_input
            puts film.title
            puts film.summary
          end
        end
      end
    end

  end
end
