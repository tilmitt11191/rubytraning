
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "html_manager.rb"

class Singer
	#var
	@log
	@name
	@CDs #CD array[]
	@songs #hash[] key=song, value=CDtitle1,CDtitle2,...
	
	def initialize
		@log = Logger.new("etc/log", shift_size = 1048576)
		@log.info "[class Singer] initialize start"
		
		@log.info "[class Singer] initialize finish"
	end	

end