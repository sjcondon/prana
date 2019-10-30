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
        # product_description
        collect_clothing
        do_next
    end    
    
    def list_clothing
        puts "Choose the clothing you would like to view."
        @clothing.each.with_index(1) do |clothing,index| 
            #.with_index makes it start at "1"
            #iterates via clothing array
            puts "#{index}. #{clothing.name}" #lists all of the clothings
            
        end
    end
    # def product_description
    # puts "Product Description"
    #     @product.each do |product|
    #         puts "#{product.name}"
    #     end
    


    def collect_clothing
        chosen_number = gets.strip.to_i
        show_clothing(chosen_number) if valid_input(chosen_number, @clothing) #taking from the show_clothing method
    end
    
    
    def valid_input(input,data)
        input.to_i <= data.length && input.to_i > 0 #input to iterate the data length input which is > 0
    end

    def show_clothing(chosen_number)
        user_chosen_clothing = @clothing[chosen_number -1]
        
        puts "Here is your clothing for the #{user_chosen_clothing.name}..."
        puts "#{user_chosen_clothing.price}"

        Prana::Scraper.scrapes_product_description(user_chosen_clothing) #scrape product det.
        
        puts ""
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