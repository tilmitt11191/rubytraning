
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "html_manager.rb"

class CD
	#var
	@log
	@titleID
	@title
	@songs #str array[]
	@webpages #HTML_manager hash[]
	
	attr_reader :titleID
	attr_reader :title
	attr_accessor:songs
	attr_accessor :webpages
	
	def initialize(titleID, title)
		@log = Logger.new("etc/log", shift_size = 1048576)
		@log.info "[class CD] initialize start"
		@log.info "titleID: "+ titleID
		@log.info "title: " + title

		@titleID = titleID
		@title = title
		
		@songs = []
		@webpages = {}
		
		@log.info "[class CD] initialize finish"
	end	
	
end

