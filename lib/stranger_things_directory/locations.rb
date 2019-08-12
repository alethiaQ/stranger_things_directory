class StrangerThingsDirectory::Locations
    attr_accessor :name, :url, :description, :type, :inhabitants, :area

    @@all = []
    def self.new_location(location)
        self.new(
            location.css("a figure figcaption.category-page__trending-page-title").text, 
            "https://strangerthings.fandom.com#{location.css("a").attribute("href").text}"
        )
    end
    def initialize(name=nil, url=nil)
        @name = name
        @url = url
        @@all << self 
    end
  
    def doc
        @doc ||= Nokogiri::HTML(open(self.url))
    end

    def description        
        @description ||= doc.css("div#WikiaMainContentContainer.WikiaMainContentContainer div#WikiaArticle.WikiaArticle div#mw-content-text.mw-content-ltr.mw-content-text p").text
       
    end

    def self.all 
        @@all 
    end
    
    def self.find(id)
        self.all[id-1]
    end

    def inhabitants
        @inhabitants ||= 
        doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=inhabitants] a").collect {|a| a.text }
    end

    def area 
        @area ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=location] a").collect {|a| a.text}
    end


    def type 
        @type ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=type] div.pi-data-value.pi-font").collect {|a| a.text}
    end
end

    