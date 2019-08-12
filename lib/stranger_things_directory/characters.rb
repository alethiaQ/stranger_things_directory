class StrangerThingsDirectory::Characters
    attr_accessor :url, :name, :gender, :status, :age, :born, :aliases, :residence, :family, :affiliation, :occupation, :actor 
   
    @@all = []
   
       def self.new_character(char)
       self.new(
           char.css("a figure figcaption.category-page__trending-page-title").text, 
           "https://strangerthings.fandom.com#{char.css("a").attribute("href").text}"
       )
       end
       def initialize(name=nil, url=nil)
       @name = name
       @url = url
       @@all << self
       end
   
       def self.all
       @@all
       end
   
       def self.find(index)
       @@all[index -1]
       end
   
       def doc 
       @doc ||= Nokogiri::HTML(open(self.url)) 
       end
   
       def gender
        @gender ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=gender] div.pi-data-value.pi-font").text
        
       end

       def actor 
        @actor ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=portrayer] a").text
       end
       
       def status
        @status ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=status] div.pi-data-value.pi-font").text
       end

       def born
        @born ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=born] div.pi-data-value.pi-font").text
       end

       def aliases
        @aliases ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=aliases] div.pi-data-value.pi-font").collect {|p| p.children.text}
       end

       def residence
        @residence ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=residence] div.pi-data-value.pi-font a").collect {|a| a.text}        
       end
       
       def affiliation
        @affiliation ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=affiliation] div.pi-data-value.pi-font a").collect {|a| a.text}
       end

       def age 
        @age ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=age] div.pi-data-value.pi-font").collect {|a| a.text}
       end
   
       def occupation
        @occupation ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=occupation] div.pi-data-value.pi-font").collect {|a| a.text}
       end

       def family
        @family ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=relatives] div.pi-data-value.pi-font").collect {|a| a.text}
       end
 

   
   end