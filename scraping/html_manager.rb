
#ruby
require	"logger"
require "csv"
require 'open-uri'
require 'nokogiri'

class HTML_manager
	#var
	@log
	@input_url
	@input_row_data
	@input_file
	@cookie

	def initialize(input_url, cookie)
		@log = Logger.new("log")
		@input_url = input_url
		@cookie = cookie
		#@input_row_data = open(@input_url, @cookie).read
		#@input_row_data = open(THE_URI, { 'Cookie' => cookie_str }) {|f| ... }
		@input_row_data = open(@input_url, { 'Cookie' => @cookie })
		@input_file = Nokogiri::HTML.parse(@input_row_data, @input_url)
	end

	#def read_input_file
	#def read_html()
		#@util.info("read_html["+ @input_filename + "]")
		#if input_filename not exist. fatal
		#@input_file=Nokogiri::HTML(File.open(@input_filename))
	#end

	def print_input_file()
		#@util.info("print input_file "+ input_filename)
		print @input_file
	end

	def get_title()
		return @input_file.title
	end

	def output_row_data(output_file_name)
		#File.open(output_file_name, "w")do |file|
			#File.open(@input_row_data, "r") do |row|
			#@input_file.each do |row|
			#	p row.read
			#	file << row
			#end
		#end

		@input_row_data.each do |line|
			print "aaa"
		end
	end

	##def read_***
end
