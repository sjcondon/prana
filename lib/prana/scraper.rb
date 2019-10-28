class Prana::Scraper
   def self.scrapes_discounts 
    html = "https://www.prana.com/sale/womens-sale.html#prefv2=XS%7C00&prefv1=5%20Stars%7C4%20Stars%20%26%20Up&prefn2=size&prefn1=reviewRating"
    doc = Nokogiri::HTML(html)
   end
end