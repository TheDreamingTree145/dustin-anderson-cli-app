

class MovieScraper

  BASE_RT_URL = "https://www.rottentomatoes.com/"

  def get_main_page
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
  end

  def new_with_attributes
    self.get_top_page.css(".table tr").drop(1).each do |row|
      movie = DustinAndersonCLIApp::Movie.new
      movie.rank = row.css(".bold").text.delete!(".")
      movie.rating = row.css(".tMeterScore").text.gsub!(/\u00A0/, "")
      movie.title = row.css(".unstyled").text
      movie.title.strip!
      movie.reviews = row.css("td.right-hidden-xs").text
      link = row.css("a").attribute("href").value.sub("/", "")
      details_doc = BASE_RT_URL + link
      open_details_doc = Nokogiri::HTML(open(details_doc))
end
