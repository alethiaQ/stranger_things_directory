class StrangerThingsDirectory::LocationScraper
    attr_accessor :locations, :urls_list, :doc

    @locations = []
    @urls_list = []
    def open_page
       Nokogiri::HTML(open("https://strangerthings.fandom.com/wiki/Category:Locations"))
        #binding.pry
    end

    def get_locations
       self.open_page.css("div#WikiaArticle.WikiaArticle ul.category-page__trending-pages li.category-page__trending-page")
        #binding.pry

    end
    def send_locations
        
        get_locations.each do |location|
        StrangerThingsDirectory::Locations.new_location(location)
    end
end




end