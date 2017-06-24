require_relative './movie_scraper'
require_relative './dustin_anderson_cli_app'

module DustinAndersonCLIApp
  class Controller

    def call
      puts "Welcome to Rotten Tomatoes top 100 movies! This will list the rank, title, rating, and the number of reviews on Rotten Tomatoes. Once you choose how many movies to see at once, just input the rank of the movie to see the movie consensus. At any time you can type 'exit' to quit the program, or options for a list of options\n\n"
    end

  end
end
