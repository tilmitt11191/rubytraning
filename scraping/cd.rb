
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "html_manager.rb"

class CD
	#var
	@log
	@title
	@titleID
	@songs #str array[]
	@webpages #HTML_manager hash[]
	
	def initialize
		@log = Logger.new("log", shift_size = 1048576)
		@log.info "[class CD] initialize start"
		
		@log.info "[class CD] initialize finish"
	end	

end

