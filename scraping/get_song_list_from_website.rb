
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"
require_relative "html_manager.rb"
require_relative "cd.rb"

module Get_html_file
	def create_serched_page(search_url, cookie, default_charset)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].create_serched_pages start"
		log.info "serch_url: " + search_url
		log.info "cookie: " + cookie
		html=HTML_manager.new(serch_url, cookie, default_charset, "", "")
	end
end

module Get_song_list_from_website_tsutaya
	def create_serched_pages(search_url, cookie, default_charset)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].create_serched_pages start"
		log.info "serch_url: " + search_url
		log.info "cookie: " + cookie

		searched_pages = [] #HTML_manager array[]
		
		i = 1
		while true
			log.info "searching PN[" + i.to_s + "]"
			html=HTML_manager.new(search_url+"&PN=" +i.to_s ,cookie,default_charset, "tsutaya-discas", "cd")
			#p html.get_title
			#print "i = " + i.to_s + "\n"
			#print html.input_file.css('.columnErrType01Txt01').inner_text + "\n"
			if html.input_file.css('.columnErrType01Txt01').inner_text.include?("見つかりませんでした") then
				log.info "break at i="+ i.to_s
				log.info "html.input_file.css('.columnErrType01Txt01') =\n" + html.input_file.css('.columnErrType01Txt01').inner_text
				log.info "include (見つかりませんでした)"
				break
			end
			searched_pages.push(html)
			i += 1
		end
		
				
		log.info "[module get_song_list_from_website_tsutaya].create_serched_pages finished"
		return searched_pages
	end



	def create_CD(html)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].create_CD start"
		
		cd_list = []
		
		get_cd_list(html).each do |titleID, title|
			cd_url = "http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID=" + titleID
			cd = CD.new(titleID, title)
			webpage = HTML_manager.new(cd_url, html.cookie, html.charset, "tsutaya-discas", titleID)
			cd.webpages["tsutaya-discas"] = webpage
			songs = get_songs(cd)
			cd.songs = songs
			cd_list.push(cd)
		end
		
		log.info "[module get_song_list_from_website_tsutaya].create_CD finished"
		return cd_list
	end



	def get_cd_list(html)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].get_cd_list start"

		cd_list = {} # hash str 

		array = html.input_file.css('.tblColType01Cell01').css('a')
		array.each do |line|
			titleID = get_titleID line[:href]
			title = line.children.attribute("alt").to_s
			cd_list[titleID] = title
			@log.info ("titleID[" + titleID + "] title[" + title + "]")
		end

		log.info "[module get_song_list_from_website_tsutaya].get_cd_list finished"
		return cd_list
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



	def get_songs(cd)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].get_songs start"
		log.info "cd.title: " + cd.title
		log.info "cd.webpages["+cd.titleID+"]: " + cd.webpages["tsutaya-discas"].property
		@cd = cd
		@cd.songs = [] #initialize
		@html = get_html(@cd)
		if @html == nil then
			log.warn "[module get_song_list_from_website_tsutaya].get_songs"
			log.warn "html is nill"
		else
			log.info "get songs from "+@html.input_url
			songs_array = @html.input_file.css('.zebla/td/ul/li')
			songs_array.each do |song_element|
				song = song_element.inner_text
				song.gsub!(/(\s)/,"") #remove CRLF, space
				song.gsub!(/(\t)/,"") #remove tab
				@cd.songs.push song
			end
		end

		log.info "[module get_song_list_from_website_tsutaya].get_songs finished"
		return @cd
	end
	
	
	
	def get_html(cd)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].get_html start"
		log.info "cd.title: " + cd.title
		log.info "cd.titleID: " + cd.titleID
		html = nil
		if cd.webpages.has_key?("tsutaya-discas") then
			html = cd.webpages["tsutaya-discas"]
		end
		log.info "[module get_song_list_from_website_tsutaya].get_html finished"
		return html
	end
	
	
	
	def format_song_list(cd)
		log = Logger.new("etc/log")
		log.info "[module get_song_list_from_website_tsutaya].format_song_list start"
		log.info "cd title: " + cd.title.to_s
		formed_songs = []
		cd.songs.each do |song|
			formed_song = song
			log.info "\nsong: " + song.to_s
			#### format
			formed_song.gsub!(/(\s)/,"") #remove CRLF, space
			formed_song.gsub!(/(\t)/,"") #remove tab
			#formed_song.sub!(/\A\d/,"") # remove head number.
			while /\A\d/ =~ formed_song do
				formed_song.sub!(/\A\d/,"")
			end
			formed_song.sub!(/\A\./){$1} # remove head [.].
			formed_song.sub!(/(.*)\(.*/){$1} # remove after last [(].
			
			####
			log.info "\nformed_song: " + formed_song.to_s
			formed_songs.push formed_song
		end
		formed_cd = cd
		formed_cd.songs = formed_songs
		log.info "[module get_song_list_from_website_tsutaya].format_song_list finished"
		return formed_cd
	end

end

