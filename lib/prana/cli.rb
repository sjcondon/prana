class Prana::CLI
    
    def call
        Prana::Scraper.scrapes_discounts #want to scrape once
        puts "Enjoy these discounts!"
        start #to start the program
        
        
    end
    #names methods
    def start 
        get_clothing
        list_price
        product_discription
    end

    def get_clothing 
        @clothing = Prana::Clothing.all
        #@clothing is a class variable
    end
    
    def list_price
        puts "Choose the clothing you would like to view."
        @clothing.each.with_index(1) do |clothing,index|
            puts "#{index}. #{clothing.name}"
        end
    end
    
    def product_discription
        chosen_number = gets.strip.to_i
        show_clothing_for(chosen_number) if valid_input(chosen_number, @clothing)
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
        input = gets.strip
        if input == "y"
            start #you will call start
        elsif input == "n"
        exit #leave the program
        else 
            puts "Enter something please"
            do_next 
        end
    end
end