
#ruby
require	"logger"
require "csv"
require 'kconv'
require 'open-uri'
require 'nokogiri'

class HTML_manager
	#var
	@log
	@input_url
	@input_row_data
	@input_file
	@cookie

	attr_reader :input_file

	def initialize(input_url, cookie, charset)
		@log = Logger.new("log")
		@log.info("HTML_manager initialize uri[" + input_url + "]")
		@input_url = input_url
		@cookie = cookie
		@input_row_data = open(@input_url, { 'Cookie' => @cookie })
		@input_file = Nokogiri::HTML.parse(@input_row_data, @input_url, charset)
		
		@log.info("HTML_manager initialize finished")
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
			file.write @input_file
		end
	end

	##def read_***
end
