
#ruby
require	"logger"
require_relative "html_manager.rb"

class Singer_manager
	#var
	@log
	@singer
	@search_results #HTML_manager
	@discography #hash
	
	def initialize(singer, search_results)
		@log = Logger.new("log")
		@log.info("singer_manager initialize " + singer)
		@singer = singer
		@search_results = search_results
		@discography = {}
		get_discography

		@log.info("Singer_manager initialize finished")
	end
	
	def get_discography
		@log.info("get_discography start")
		array = @search_results.input_file.css('.tblColType01Cell01').css('a')
		array.each do |line|
			#p title[:href]
			#p title.children.attribute("alt").to_s
			#p title.css('img').attribute("alt").to_s
			#p title.size
			#p title.css('img')[:alt]
			#img = title.css('.img')
			#p title.css('a')[:href]
			#p img[:alt]
			titleID = get_titleID line[:href]
			title = line.children.attribute("alt").to_s
			@discography[titleID] = title
			@log.info ("titleID[" + titleID + "] title[" + title + "]")
			#print title[:onmouseover],"\n"
			#p titleID
		end
		@log.info("get_discography finished")
	end
	
	def get_titleID(title_str)
		@log.info("get_titleID from "+title_str + " start")
			separator = ","
			titleID = nil
			str = title_str.gsub(/[\?&]/,separator)
			str_array = str.split(separator)
			str_array.each do |line|
				if line.include?("titleID=") then
					titleID = line.split("=")[1]
				end
			end
		@log.info("get_titleID finished return " + titleID)
		return titleID
	end
	
	def print_discography
		p @discography
	end
	
end

