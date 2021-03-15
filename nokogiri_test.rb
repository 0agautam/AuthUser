require 'rubygems'
require 'nokogiri'
require 'open-uri'

# url1 = "https://www.snapdeal.com/search?keyword=batman&santizedKeyword=&catId=&categoryId=0&suggested=false&vertical=&noOfResults=20&searchState=&clickSrc=go_header&lastKeyword=&prodCatId=&changeBackToAll=false&foundInAll=false&categoryIdSearched=&cityPageUrl=&categoryUrl=&url=&utmContent=&dealDetail=&sort=rlvncy"


url = "https://www.bewakoof.com/search/batman?ga_q=batman"

doc = Nokogiri::HTML(URI.open(url))

doc.css(".col-xs-6").each do |item|
  title = item.at_css("h3").text
  price = item.at_css(".discountedPriceText").text
  puts item.at_css("h3")[:href]
  puts "#{title} - #{price}"

end



