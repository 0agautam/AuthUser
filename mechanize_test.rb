require 'mechanize'
require 'rubygems'
# mechanize = Mechanize.new
# page = mechanize.get('http://en.wikipedia.org/wiki/Main_Page')
# puts page.attributes
# link = page.link_with(text: 'Random article')
# puts link.attributes
# page = link.click
# puts page.uri

mechanize = Mechanize.new
page = mechanize.get('https://en.wikipedia.org/wiki/Main_Page')
form = page.forms.first
form['search'] = 'passport'
page = form.submit
count =0
page.search('a').each do |ele|
  puts ele.text.strip
  count +=1
end

puts "Number of links are #{count}"

# agent = Mechanize.new
# page = agent.get("https://www.imdb.com/")

# #puts page.title

# form = page.forms.first
# form['q'] = 'thriller'
# page = form.submit

# page.search('.findList .result_text').each do |ele|
#   puts ele.text.strip
# end