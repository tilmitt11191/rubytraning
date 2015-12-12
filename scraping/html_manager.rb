
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"
require 'open-uri'
require 'nokogiri'

class HTML_manager
	#var
	@log
	@input_url
	@input_file
	@cookie
	@site_identifier
	@property
	
	def initialize(input_url, cookie, charset)
		@log = Logger.new("log", shift_size = 1048576)
		@log.info "[class HTML_manager] initialize start"
		@log.info "input_url: "+ input_url
		@log.info "cookie: " + cookie
		@log.info "charset: " + charset
		@input_url = input_url
		@cookie = cookie
		
		input_row_data = open(input_url, { 'Cookie' => cookie })
		@input_file = Nokogiri::HTML.parse(input_row_data, input_url, charset)
		
		@log.info "[class HTML_manager] initialize finish"
	end
	
	def print_input_file()
		@log.info("print input_file "+ @input_file.title)
		print @input_file
	end

end