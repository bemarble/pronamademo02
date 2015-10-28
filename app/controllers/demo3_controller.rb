require 'open-uri'
require 'nokogiri'

class Demo3Controller < ApplicationController
  def index
    url = "http://pronama.thebase.in/"
    tag = "#mainContent > .item.part"

    @list = []
    Nokogiri::HTML(open(url)).css(tag).each do |row|
      @list.push({
        img: row.css(".itemImg > a > img").first.attributes["src"].value,
        title: row.css("a > .itemTitle > h2").text,
        link: row.css("a").first.attributes["href"].text
      })
    end
  end
end
