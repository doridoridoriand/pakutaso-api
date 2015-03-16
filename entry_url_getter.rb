require 'mechanize'
require 'csv'
require 'pp'

class EntryUrlGetter
  def access_all_item_list_page
    arr = []
    gen_item_list_url.each do |list|
      arr << get_all_item_url(list)
      sleep(10)
    end
    return arr.uniq.flatten
  end

  def get_all_item_url(target_items_url)
    array = []
    agent = Mechanize.new
    source = agent.get(target_items_url)
    source.search('div#photoList').search('ul').search('li.entries__item').search('a').each do |element|
      element.attributes.each do |entry|
        if entry[1].value.include?('.html') && entry[1].value.include?('post')
          array << entry[1].value
        end
      end
    end
    array.reject! { |item| item.include?('twitter') || item.include?('facebook') || item.include?('google') }
    array.map { |each_url|
      each_url = 'http://www.pakutaso.com' + each_url
    }
  end

  def gen_item_list_url
    array = []
    base_url = 'http://www.pakutaso.com/news'.freeze
    for i in 1..72 do
      if i == 1
        array << base_url + '.html'
      else
        array << base_url + '_' + i.to_s + '.html'
      end
    end
    array
  end

  def csv_saver(content)
    CSV.open('items.csv', 'wb') do |element|
      element << content
    end
  end
end
