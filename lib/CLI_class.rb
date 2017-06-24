require_relative './movie_scraper'
require_relative './dustin_anderson_cli_app'

module DustinAndersonCLIApp
  class Controller

    def call
      puts "Welcome to Rotten Tomatoes top 100 movies! This will list the rank, title, rating, and the number of reviews on Rotten Tomatoes. Once you choose how many movies to see at once, just input the rank of the movie to see the movie consensus. At any time you can type 'exit' to quit the program, or options for a list of options.\n\n"

      options = "Here are your options for lists: \n" "To see the top 10, enter: 'top 10'\n" "To see the top 25, enter: 'top 25'\n" "To see the top 50, enter: 'top 50'\n" "To see the full list, enter: 'list'\n\n"
    end


  end
end
