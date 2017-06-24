require "./lib/app/version"

module DustinAndersonCLIApp
  class Movie
    attr_accessor :rank, :title, :rating, :reviews, :summary, :parental, :genre, :theatre_date, :studio, :movie_scraper
    @@all = []

    def initialize(rank = nil, title = nil, rating = nil, reviews = nil, summary = nil, parental = nil, genre = nil, theatre_date = nil, studio = nil)
      @rank = rank
      @title = title
      @rating = rating
      @reviews = reviews
      @summary = summary
      @parental = parental
      @genre = genre
      @theatre_date = theatre_date
      @studio = studio
      @@all << self
    end

    def self.all
      @@all
    end

    def self.movie_summary
      options = "Here are your options for lists: \n" "To see the top 10 enter: 'top 10'\n" "To see the top 25 enter: 'top 25'\n" "To see the top 50 enter: 'top 50'\n" "To see the full list enter: 'list'\n" "To leave the program enter 'exit'\n\n"
      another_summary = 'yes'
      while another_summary != 'options'
        if another_summary == 'exit'
          break
        end
        puts "Please enter the rank of the move you would like the summary of: "
        summary_input = gets.chomp
        if summary_input == 'exit'
          break
        end
        if summary_input.to_i >= 1 && summary_input.to_i <= 100
          self.all.each do |film|
            if film.rank == summary_input
              puts "#{film.title}:"
              puts film.summary
              puts "\nIf you would like a few more details about the movie enter 'more'.If you wnat another movie summary enter 'yes'. Else type 'options' for list of options."
              another_summary = gets.chomp
              if another_summary.downcase == 'more'
                puts "#{film.title}: "
                puts " Parental Rating: #{film.parental}\n Film Genre: #{film.genre}\n In Theatres: #{film.theatre_date}\n Studio: #{film.studio}\n"
                puts "\n.If you want another movie summary enter 'yes'. Else type 'options' for list of options."
                another_summary = gets.downcase.chomp
              end
            end
          end
        end
      end
      puts "\n#{options}"
    end

    def self.random_movie_summary


  end
end
