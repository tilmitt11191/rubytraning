
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"
require 'open-uri'
require 'nokogiri'

class HTML_manager
	#var
	@log
	@input_url
	@input_row_data
	@input_file
	@cookie
	@charset
	@site_identifier
	@property

	attr_reader :input_url, :input_row_data, :input_file
	attr_reader :cookie
	attr_reader :charset
	attr_reader :site_identifier
	attr_reader :property
	
	def initialize(input_url, cookie, charset, site_identifier, property)
		@log = Logger.new("etc/log")
		@log.info "[class HTML_manager] initialize start"
		@log.info "input_url: "+ input_url
		@log.info "cookie: " + cookie
		@log.info "charset: " + charset
		@input_url = input_url
		@cookie = cookie
		@charset = charset
		@site_identifier = site_identifier
		@property = property

		@input_row_data = open(input_url, { 'Cookie' => cookie })
		@input_file = Nokogiri::HTML.parse(input_row_data, input_url, charset)
		
		@log.info "[class HTML_manager] initialize finish"
	end
	
	def print_input_file()
		@log.info("print input_file "+ @input_file.title)
		print @input_file
	end


	def get_title()
		@log.info("get_title "+ @input_file.title)
		return @input_file.title
	end

	def output_input_file(output_file_name)
		@log.info("output_input_file "+ @input_file.title + " to " + output_file_name)
		File.open(output_file_name, "w") do |file|
			file.write @input_row_data.read
		end
	end


end