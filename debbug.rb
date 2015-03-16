require 'mechanize'
require 'pp'
require 'json'

class AAA
  def picker
    agent = Mechanize.new
    source = agent.get('http://www.pakutaso.com/20150312075post-5281.html')
    keywords = []
    source.search('//dd[@class="entryTags__description"]/a/span/text()').map do |element|
      keywords << element.text
    end
    title = source.search('//title')[0].children[0].text.split('｜')[0]
    img = source.search('//dd[@class="download__btn"]/a[last()]/@href')[0].value

    data = {
      :title => title,
      :keywords => keywords,
      :img => img
    }
    puts JSON.pretty_generate(data)
  end
end

aaa = AAA.new
aaa.picker
