class Prana::Scraper
   def self.scrapes_discounts 
    html = open("https://www.prana.com/sale/womens-sale.html#prefv1=5%20Stars&prefn1=reviewRating&pos=0")
    doc = Nokogiri::HTML(html)
   gear = doc.css("div.col-6 col-lg-4 col-xl-3 js-grid-tile")
   gear.each_with_index do |clothes,index|
      name = clothes.css(".link")[index].children.text
      price = clothes.css("span.value.discounted")[index].children.text
      url =
      Prana::Gear.new(name,price,url)
      binding.pry
   end
end
end