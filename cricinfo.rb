require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "https://www.espncricinfo.com/ci/engine/match/index.html?view=calendar"
doc = Nokogiri::HTML(URI.open(url))

block = doc.css("section.calendar-month-head")
month = block.map { |element| element.text.strip  }
puts month.size
puts month.inspect

# block = doc.css("section.calendar-match-list")
# puts block.size
# puts block


match_date=[]
match_series=[]
match_name=[]
count = 0

doc.css("section.calendar-match-list").each do |match_list|
  match_list.css("section.calendar-match-day").each do |match_day|
    
    match_date.push(match_day.at_css("section.calendar-match-date").text.strip)

    match_day.css("section.calender-match-detail p.match-series-name").each do |match_series_detail|
      match_series.push(match_series_detail.text.strip)
    end

    match_day.css("section.calender-match-detail p.match-name").each do |match_name_detail|
      match_name.push(match_name_detail.text.strip)
    end
  end
end

puts match_date.size
puts match_date.inspect
puts match_series.size
puts match_series.inspect
puts match_name.size
puts match_name.inspect

# p = []
# doc.css("section.calendar-match-list:nth-child(3) > section:nth-child(1) > section.calender-match-detail p.match-name").each do |para|
#   p.push(para.text.strip)
# end

# puts p.size
# puts p.inspect
 #section.calendar-match-list:nth-child(3) > section:nth-child(1) > section:nth-child(2)

