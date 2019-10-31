class Prana::Clothing
    attr_accessor :name, :url, :price, :description

    @@all = []
    
    def initialize(name,price,url)
        @name = name
        @price = price
        @url = url 
        @description = []
        @@all << self 
    end


    def self.all
        @@all
    end



end

### Clothing.new(name,url,price)