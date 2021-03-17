require 'rubygems'
require 'nokogiri'
require 'open-uri'


# url = "https://accounts.google.com/signin/v2/identifier?hl=en-GB&continue=https%3A%2F%2Fmail.google.com%2Fmail&service=mail&ec=GAlAFw&flowName=GlifWebSignIn&flowEntry=AddSession"

url = "https://www.google.com/search?sxsrf=ALeKk03GECQ8V2q0-t2aR6XDV3OBIOkOLw%3A1615860417976&ei=wRJQYNuYO5fE4-EPuaqD2Aw&q=love&oq=love&gs_lcp=Cgdnd3Mtd2l6EAMyBQgAEJECMgUIABCRAjIFCC4QsQMyBQgAELEDMgUIABCxAzIFCAAQsQMyBQgAELEDMgYIABAHEB4yBggAEAcQHjIGCAAQBxAeOgcIABBHELADUKmI1QNYqYjVA2DlitUDaAFwAngAgAGnA4gBzgSSAQcwLjEuNC0xmAEAoAEBqgEHZ3dzLXdpesgBCMABAQ&sclient=gws-wiz&ved=0ahUKEwib_eCR3bPvAhUX4jgGHTnVAMsQ4dUDCAw&uact=5"

doc = Nokogiri::HTML(URI.open(url))

abc = doc.css("a.WpKAof") 
puts abc

doc.errors

# abc = doc.css("div span")
# a = abc.map do |ele|
#   puts ele
# end
