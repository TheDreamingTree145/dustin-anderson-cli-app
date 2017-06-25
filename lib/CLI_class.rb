require_relative './movie_scraper'
require_relative './dustin_anderson_cli_app'

module DustinAndersonCLIApp
  class Controller
    attr_accessor :movie_scraper, :movie

    def call

      options = "Here are your options for lists: \n" "To see the top 10 enter: 'top 10'\n" "To see the top 25 enter: 'top 25'\n" "To see the top 50 enter: 'top 50'\n" "To see the full list enter: 'list'\n" "To see a random movie summary from the list enter 'random'\n" "To leave the program enter 'exit'\n\n"

      summary_reminder = "\nIf you would like to see a movie summary, enter 'movie summary' and then the rank of the movie you would like the summary of.\n\n"

      puts "Welcome to Rotten Tomatoes top 100 movies! This will list the rank, title, rating, and the number of reviews on Rotten Tomatoes. Once you choose how many movies to see at once, just input the rank of the movie to see the movie summary. At any time you can type 'exit' to quit the program, or options for a list of options. Each list will put the film rank, title, Rotten Tomato ranking, and the number of reviews.\n\n"

      puts options
      input = ""
      scrape = MovieScraper.new
      scrape.new_with_attributes
      while input.downcase != 'exit'
        input = gets.chomp
        if input.downcase == 'top 10'
          DustinAndersonCLIApp::Movie.top_ten
          puts summary_reminder
          puts options
        elsif input.downcase == 'top 25'
          DustinAndersonCLIApp::Movie.top_twentyfive
          puts summary_reminder
          puts options
        elsif input.downcase == 'top 50'
          DustinAndersonCLIApp::Movie.all[0..49].each do |film|
            puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
          end
          puts summary_reminder
          puts options
        elsif input.downcase == 'list'
          DustinAndersonCLIApp::Movie.all[0..99].each do |film|
            puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
          end
          puts summary_reminder
          puts options
        elsif input.downcase == 'options'
          puts options
        elsif input.downcase == 'movie summary'
          DustinAndersonCLIApp::Movie.movie_summary #
        elsif input.downcase == 'random'
          DustinAndersonCLIApp::Movie.random_movie_summary
          puts "\n#{options}"
        else puts options
        end
      end
    end


  end
end
