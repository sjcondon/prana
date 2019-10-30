class Prana::Scraper
   def self.scrapes_discounts 
    html = open("https://www.prana.com/sale/womens-sale.html?prefn1=reviewRating&pmpt=discounted&prefv1=5%20Stars&pmid=dynamic-category-promotion-sale#pos=1&prefv1=5%20Stars&prefn1=reviewRating")
    doc = Nokogiri::HTML(html)
      clothing = doc.css("div.col-xl-80-percent div.js-grid-tile")
      
      clothing.each do |clothes|
         name = clothes.css(".link").children.text.gsub("View Product Details", "")
         price = clothes.css("span.value.discounted").text
         url = clothes.css("a").attribute("href").value
         

         Prana::Clothing.new(name,price,url)
         end
    end
    def self.scrapes_product_description(user_chosen_clothing)     
      binding.pry 
      html = open("https://www.prana.com#{user_chosen_clothing.url}")
      doc = Nokogiri::HTML(html)
      product = doc.css("div.product__details__description li")
      products.each do |clothes|
      end
   end