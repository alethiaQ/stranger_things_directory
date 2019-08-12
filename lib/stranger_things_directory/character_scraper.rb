class StrangerThingsDirectory::CharacterScraper

    def open_page 
        Nokogiri::HTML(open("https://strangerthings.fandom.com/wiki/Category:Characters"))
       
    end

    def get_characters
       self.open_page.css("div#WikiaArticle.WikiaArticle ul.category-page__trending-pages li.category-page__trending-page")
        
    end

    def send_characters
        self.get_characters.each do |character|
            StrangerThingsDirectory::Characters.new_character(character)
        end
    end

end