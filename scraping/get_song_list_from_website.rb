
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"
require_relative "html_manager.rb"

module Get_song_list_from_website_tsutaya
	def create_serched_pages(search_url, cookie, default_charset, searched_pages)
		log = Logger.new("log")
		log.info "[module get_song_list_from_website_tsutaya].create_serched_pages start"
		log.info "serch_url: " + search_url
		log.info "cookie: " + cookie
		
		i = 1
		while true
			log.info "searching PN[" + i.to_s + "]"
			if i == 6 then
				break
			end
			i += 1
		end
		html=HTML_manager.new(search_url+"&PN=6",cookie,default_charset)
		#html.print_input_file
		
		log.info "[module get_song_list_from_website_tsutaya].create_serched_pages finished"
	end

end

