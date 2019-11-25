class StrangerThingsDirectory::CLI

    def call
    StrangerThingsDirectory::LocationScraper.new.send_locations
    StrangerThingsDirectory::CharacterScraper.new.send_characters
    welcome_message 
    end

    def welcome_message
             
        puts "  .   *        .       . "
        puts " *      -0-                  "
        puts "     .                .  *       - )-"
        puts "   .      *       o       .       *"
        puts " o                |"
        puts "           .     -O-"
        puts ".                 |        *      .     -0-"
        puts "       *  o     .    '       *      .        o"
        puts "             .         .        |      *"
        puts "   *             *              -O-          ."
        puts "         .             *         |     ,"
        puts "                .           o"
        puts "        .---."
        puts "  =   _/__~0_\_     .  *            o       '"
        puts " = = (_________)             ."
        puts "                 .                        *"
        puts "       *               - ) -       *      "
        puts ""       
      
        puts ""
        puts "Welcome to the Stranger Things character and location directory!"
        puts ""
       
        play
    end

    def play 
        puts ""
        puts "If you would like to see a list of trending characters enter 1, for locations enter 2. Or if you would like to exit, enter exit: "

        input = gets.strip

        case input
        when "1"
            character_list
        when "2"
            location_list
        when "exit"
            exit_message           
        else
            puts "I'm sorry, that didn't work. Try again!"
           play
        end

    end

    def location_list   
        puts ""
        puts "A list of popular locations from the show will appear below. After, pick a number to learn more about that location!"
        puts ""
        puts "------Stranger Things Locations:------"
        StrangerThingsDirectory::Locations.all.each_with_index do |location, index|
            puts "#{index +1}. #{location.name}"
        end
        pick_location
    end
    
    def pick_location
        puts "What location would you like to learn more about? Enter the number: "
        input = gets.strip.to_i
        if input < StrangerThingsDirectory::Locations.all.length + 1 && input > 0
            location = StrangerThingsDirectory::Locations.find(input)

            location_info(location)
          
        else
            puts 'Try again'
            pick_location
        end
    end
    
    def location_info(location)
        puts ""
        puts "*************** #{location.name} ***************"
        puts ""
        puts "Type:             #{location.type.join(" ")}"
        puts "Inhabitants:      #{location.inhabitants.join(", ")}"
        puts "Area:             #{location.area.join(", ")}"
        puts "To learn more:    #{location.url}"
        puts ""
        puts "About:            #{location.description}"
        puts "****************************************************"
       
        play 
        
    end

    def character_list
        puts ""
        puts "A list of characters currently trending will appear below. After, pick a number to learn more about that character in particular!"
        puts ""
        puts ">>>>>>>>>> Stranger Things Characters: <<<<<<<<<<<<<"
        StrangerThingsDirectory::Characters.all.each_with_index do |char, index|
            puts "#{index +1 }. #{char.name}"
        end
        pick_character
    end
    
    def pick_character
        puts ""
        puts "What character would you like to learn more about? Enter their number: "

        input = gets.strip
        character = StrangerThingsDirectory::Characters.find(input.to_i)

        character_info(character)
    end

    def character_info(character)
        puts ""
        puts "************ #{character.name} **************"
        puts ""
        puts "Status:           #{character.status}"
        puts "Gender:           #{character.gender}"   
        puts "Age:              #{character.age.join(" ")}"
        puts "Year Born:        #{character.born}"
        puts "Portrayed By:     #{character.actor}"
        puts "Residence(s):     #{character.residence.join(", ")}"
        puts "Affiliation(s):   #{character.affiliation.join(", ")}"
        puts "Occupation:       #{character.occupation.join(", ")}"
        puts "Family:           #{character.family.join(", ")}"
        puts "To learn more:    #{character.url}"
        puts "**********************************************"

        play
    end

    def exit_message
            puts "Thanks for dropping in. Until next time "
    end

end