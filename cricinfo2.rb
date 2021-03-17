require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "https://www.espncricinfo.com/ci/engine/match/index.html?view=calendar"
doc = Nokogiri::HTML(URI.open(url))

month_head = Hash.new
match_date = Hash.new
match_name = ""
arr = []
  doc.css("section.calendar-block section.calendar-match-list section.calendar-match-day section.calendar-match-date").each do |match_date|
    arr.push(match_date.text.strip)
  end

puts arr.inspect
arr = match_name.split("")
#p arr.inspect