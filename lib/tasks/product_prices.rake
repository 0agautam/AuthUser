desc "Fetch product prices"
task :fetch_prices => :environment do
  
  require 'nokogiri'
  require 'open-uri'

  Product.where(price: nil).each do |product|
    url = "https://www.bewakoof.com/search/#{CGI.escape(product.name)}"
    doc = Nokogiri::HTML(URI.open(url))
    price = doc.at_css(".discountedPriceText").text[/[0-9\.]+/]
    puts doc.at_css("h3")[:href]
    product.update_attribute(:price, price)
  end
end
#https://www.flipkart.com/search?q=batman&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off