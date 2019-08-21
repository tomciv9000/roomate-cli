class RoomScraper
  
  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
  end
   
  def call
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc))
    end
  end

private
  def rows 
   @rows ||= @doc.search("div.content ul.rows li.result-row p.result-info")
  end
  
  def scrape_row(row)
    #scrape an individual row
    {
    :date_created => row.search("time.result-date").attribute("title").value,
    :title => row.search("a.result-title.hdrlnk").text,
    :url => row.search("a.result-title.hdrlnk").attribute("href").value,
    :price => row.search("span.result-price").text,
    }
  end

end