class Prana::CLI
    def call
        puts "Enjoy these discounts!"
        get_clothing
        list_price
        product_discription
    end
    
    def get_clothing 
        Prana::Scraper.scrapes_discounts 
        @clothing = Prana::Clothing.all
       binding.pry
        #@name is a class variable
    end
    
    def list_price
        puts "Choose the clothing you would like to view."
        @clothing.each.with_index(1) do |name,index|
            puts "#{index}. #{clothing.name}"
        end
    end
    
    def product_discription
        chosen_number = gets.strip.to_i
        show_discription_for(chosen_number) if valid_input(chosen_number, @name)
    end

    def valid_input(input,data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_clothing_for(chosen_number)
        clothing = @clothing[chosen_number -1]
        puts "Here is your clothing for the #{name}..."

        clothing.price.each.with_index(1) do |price,index|
            puts "#{index}. #{price}"
    end
end
end