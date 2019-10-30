class Prana::CLI
    
    def call
        Prana::Scraper.scrapes_discounts #want to scrape once
        @clothing = Prana::Clothing.all #we want all of the clothing objects to go into the clothing
        puts "Enjoy these discounts!"
        start #to start the program
        
        
    end
    #names methods
    def start         
        list_clothing
        product_discription
        do_next
    end    
    
    def list_clothing
        puts "Choose the clothing you would like to view."
        @clothing.each.with_index(1) do |clothing,index| #iterates via clothing array
            puts "#{index}. #{clothing.name}" #lists all of the clothings
        end
    end
    
    def product_discription
        chosen_number = gets.strip.to_i
        show_clothing_for(chosen_number) if valid_input(chosen_number, @clothing) #taking from the show_clothing method
    end

    def valid_input(input,data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_clothing_for(chosen_number)
        clothing = @clothing[chosen_number -1]
        puts "Here is your clothing for the #{clothing.name}..."
        puts "#{clothing.price}"
    end

    def do_next
        puts "Would you want to look at another item? y/n"

        input = gets.strip #get users input and strip takes out white space before and after what the user types. 
#then saving users input into a variable called "input"

        if input == "y"
            start #you will call start
        elsif input == "n"
            exit #leave the program
        else 
            puts "I don't understand"
            do_next 
        end
    end
end