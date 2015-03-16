require 'mechanize'
require 'pp'

class AAA
#  def picker
#    agent = Mechanize.new
#    array = []
#    source = agent.get('http://www.pakutaso.com/news_2.html')
#    source.search('div#photoList').search('ul').search('li.entries__item').search('a').each do |element|
#      element.attributes.each do |entry|
#        if entry[1].value.include?('.html') && entry[1].value.include?('post')
#          array << entry[1].value
#        end
#      end
#    end
#    pp array.reject { |item| item.include?('twitter') || item.include?('facebook') || item.include?('google') }
#    #pp array
#  end
end

aaa = AAA.new
aaa.picker
