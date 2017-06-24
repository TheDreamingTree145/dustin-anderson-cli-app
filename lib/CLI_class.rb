require_relative './movie_scraper'
require_relative './dustin_anderson_cli_app'

module DustinAndersonCLIApp
  class Controller

    def call

      options = "Here are your options for lists: \n" "To see the top 10, enter: 'top 10'\n" "To see the top 25, enter: 'top 25'\n" "To see the top 50, enter: 'top 50'\n" "To see the full list, enter: 'list'\n\n"

      concensus_reminder = "\nIf you would like to see a movie consensus, enter 'movie consensus' and then the rank of the movie you would like the concensus of.\n\n"

      puts "Welcome to Rotten Tomatoes top 100 movies! This will list the rank, title, rating, and the number of reviews on Rotten Tomatoes. Once you choose how many movies to see at once, just input the rank of the movie to see the movie consensus. At any time you can type 'exit' to quit the program, or options for a list of options.\n\n"

      puts options
      input = ""
      while input.downcase != 'exit'
        input = gets.chomp
        if input.downcase == 'top 10'
          10.times do #temporary
            puts "\ntop 10"
          end
          puts concensus_reminder
          puts options
        elsif input.downcase == 'top 25'
          25.times do #change
            puts "\ntop 25" # change
          end
          puts concensus_reminder
          puts options
        elsif input.downcase == 'top 50'
          50.times do #change
            puts "\ntop 50" #change
          end
          puts concensus_reminder
          puts options
        elsif input.downcase == 'list'
          100.times do #change
            puts "\ntop 100" #change
          end
          puts concensus_reminder
          puts options
        elsif input.downcase == 'options'
          puts options
        elsif input.downcase == 'movie concensus'
          DustinAndersonCLIApp::Movie.movie_concensus
        else puts options
        end
      end
    end


  end
end
