$:.unshift File.dirname(__FILE__)
require 'entry_url_getter.rb'
require 'json'
require 'pp'

class EntryPagePicker < EntryUrlGetter

  def save_json
    data = '['
    access_all_item_list_page.each do |each_entry|
      data << (JSON.dump(parse_entry_page(each_entry)) + ',').to_s
    end
    data.chop!
    data << ']'
    open('all_entries.json', 'wb') do |io|
      io << data
    end
  end

  def parse_entry_page(each_entries)
    agent = Mechanize.new
    source = agent.get(each_entries)
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
  end
end

epp = EntryPagePicker.new
epp.save_json
