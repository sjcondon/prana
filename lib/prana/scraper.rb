class Prana::Scraper
   def self.scrapes_discounts 
    html = open("https://www.prana.com/sale/womens-sale.html?prefn1=reviewRating&pmpt=discounted&prefv1=5%20Stars&pmid=dynamic-category-promotion-sale#pos=1&prefv1=5%20Stars&prefn1=reviewRating")
    doc = Nokogiri::HTML(html)
      clothing = doc.css("div.col-xl-80-percent div.js-grid-tile")
      
      clothing.each_with_index do |clothes,index|
         name = clothes.css(".link").children.text.gsub("View Product Details", "")
         price = clothes.css("span.value.discounted").text
         url = clothes.css("a").attribute("href").value
         Prana::Clothing.new(name,price,url)
         

      end
   end
end