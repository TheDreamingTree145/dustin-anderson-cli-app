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
      options = "Here are your options for lists: \n" "To see the top 10, enter: 'top 10'\n" "To see the top 25, enter: 'top 25'\n" "To see the top 50, enter: 'top 50'\n" "To see the full list, enter: 'list'\n\n"
      puts "Please enter the rank of the move you would like the critics summary of: "
      summary_input = gets.chomp
      if summary_input.to_i >= 1 && summary_input.to_i <= 100
        self.all.each do |film|
          if film.rank == summary_input
            puts "#{film.title}:"
            puts film.summary
          end
        end
      end
      puts "\n#{options}"
    end

  end
end
