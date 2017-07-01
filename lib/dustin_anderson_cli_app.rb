require "./lib/app/version"

module DustinAndersonCLIApp
  class Movie
    attr_accessor :rank, :title, :rating, :reviews, :summary, :parental, :genre, :theatre_date, :studio, :movie_scraper, :link
    @@all = []
    OPTIONS = "Here are your options for lists: \n" "To see the top 10 enter: 'top 10'\n" "To see the top 25 enter: 'top 25'\n" "To see the top 50 enter: 'top 50'\n" "To see the full list enter: 'list'\n" "To see a random movie summary from the list enter 'random'\n" "To leave the program enter 'exit'\n\n"

    def initialize(rank = nil, title = nil, rating = nil, reviews = nil, summary = nil, parental = nil, genre = nil, theatre_date = nil, studio = nil, link = nil)
      @rank = rank
      @title = title
      @rating = rating
      @reviews = reviews
      @summary = summary
      @parental = parental
      @genre = genre
      @theatre_date = theatre_date
      @studio = studio
      @link = link
      @@all << self
    end

    def self.all
      @@all
    end

    def self.top_ten
      DustinAndersonCLIApp::Movie.all[0..9].each do |film|
        puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
      end
    end

    def self.top_twentyfive
      DustinAndersonCLIApp::Movie.all[0..24].each do |film|
        puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
      end
    end

    def self.top_fifty
      DustinAndersonCLIApp::Movie.all[0..49].each do |film|
        puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
      end
    end

    def self.list_all
      DustinAndersonCLIApp::Movie.all[0..99].each do |film|
        puts "#{film.rank}. #{film.title} #{film.rating} #{film.reviews}"
      end
    end

    def self.movie_summary
      another_summary = ""
      while another_summary != 'options'
        if another_summary == 'exit'
          break
        end
        puts "Please enter the rank of the move you would like the summary of: "
        summary_input = gets.strip!
        if summary_input == 'exit'
          break
        end
        if summary_input.to_i >= 1 && summary_input.to_i <= self.all.size
          film = self.all[summary_input.to_i - 1]
          MovieScraper.new.more_details(film)
            if film.rank == summary_input
              puts "#{film.title}:"
              puts film.summary
              puts "\nIf you would like a few more details about the movie enter 'more'.If you want another movie summary enter 'yes'. Else type 'options' or press the enter key for list of options."
              another_summary = gets.downcase.strip!
              if another_summary == 'more'
                puts "#{film.title}: "
                puts " Parental Rating: #{film.parental}\n Film Genre: #{film.genre}\n In Theatres: #{film.theatre_date}\n Studio: #{film.studio}\n"
                puts "\nIf you want another movie summary enter 'yes' or press enter. Else type 'options'."
                another_summary = gets.downcase.strip!
              elsif another_summary == 'options' || another_summary == ""
                break
              end
            end

        end
      end
      puts "\n#{OPTIONS}"
    end

    def self.random_movie_summary
      random_movie_summary = self.all.sample
      puts "#{random_movie_summary.title} #{random_movie_summary.rank}: "
      puts "#{random_movie_summary.summary}\n"
    end



  end
end
