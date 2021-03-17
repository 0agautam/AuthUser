require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "https://www.espncricinfo.com/ci/engine/match/index.html?view=calendar"
doc = Nokogiri::HTML(URI.open(url))



 month,match_date,match_name = [],[],[]
 count_month = 0
 count_days = 0
 month_i=0
    doc.css("section.calendar-block section.calendar-month-head").each do |month_head|
      month.push(month_head.text.strip)
      count_month +=1
    end

    doc.css("section.calendar-block section.calendar-match-list").each do |m_list|
      m_list.css("section.calendar-match-day").each do |m_day|
        m_day.css("section.calendar-match-date").each do |m_date|
          match_date = m_date.text.strip
          if /(\A[1]\s+?)/.match(match_date) === nil then
            #print "#{match_date.concat(" ").concat(month[month_i])} "
            #object.create(month:month, match_date:)
          else
           month_i +=1
           #print "#{match_date.concat(" ").concat(month[month_i])} " 
          end

        m_day.css("section.calender-match-detail p.match-name").each do |match_name_detail|
          #match_name.push(match_name_detail.text.strip)
          match_name = match_name_detail.text.strip
          puts match_name
        end
          
        end
      end
    end
#puts count_days
#puts match_date.inspect
