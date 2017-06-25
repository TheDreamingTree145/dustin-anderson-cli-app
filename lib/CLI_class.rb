require_relative './movie_scraper'
require_relative './dustin_anderson_cli_app'

module DustinAndersonCLIApp
  class Controller
    attr_accessor :movie_scraper, :movie

    OPTIONS = "Here are your options for lists: \n" "To see the top 10 enter: 'top 10'\n" "To see the top 25 enter: 'top 25'\n" "To see the top 50 enter: 'top 50'\n" "To see the full list enter: 'list'\n" "To see a random movie summary from the list enter 'random'\n" "To leave the program enter 'exit'\n\n"

    SUMMARY_REMINDER = "\nIf you would like to see a movie summary, enter 'movie summary' and then the rank of the movie you would like the summary of.\n\n"

    def call

      puts "Welcome to Rotten Tomatoes top 100 movies! This will list the rank, title, rating, and the number of reviews on Rotten Tomatoes. Once you choose how many movies to see at once, just input the rank of the movie to see the movie summary. At any time you can type 'exit' to quit the program, or options for a list of options. Each list will put the film rank, title, Rotten Tomato ranking, and the number of reviews.\n\n"

      puts OPTIONS
      input = ""
      scrape = MovieScraper.new
      scrape.new_with_attributes
      while input.downcase != 'exit'
        input = gets.chomp
        if input.downcase == 'top 10'
          DustinAndersonCLIApp::Movie.top_ten
          puts SUMMARY_REMINDER
          puts OPTIONS
        elsif input.downcase == 'top 25'
          DustinAndersonCLIApp::Movie.top_twentyfive
          puts SUMMARY_REMINDER
          puts OPTIONS
        elsif input.downcase == 'top 50'
          DustinAndersonCLIApp::Movie.top_fifty
          puts SUMMARY_REMINDER
          puts OPTIONS
        elsif input.downcase == 'list'
          DustinAndersonCLIApp::Movie.list_all
          puts SUMMARY_REMINDER
          puts OPTIONS
        elsif input.downcase == 'options'
          puts OPTIONS
        elsif input.downcase == 'movie summary'
          DustinAndersonCLIApp::Movie.movie_summary #
        elsif input.downcase == 'random'
          DustinAndersonCLIApp::Movie.random_movie_summary
          puts "\n#{OPTIONS}"
        else puts OPTIONS
        end
      end
    end


  end
end
