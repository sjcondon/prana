class Prana::CLI
    def call
        puts "Enjoy these discounts!"
        get_gear
        list_price
        product_discription
    end
    def get_gear 
        @name = Prana::Gear.all
    Prana::Scraper.scrapes_discounts
    end
end