
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
		@log = Logger.new("etc/log")
		@log.info "[class CD] initialize start"
		@log.info "titleID: "+ titleID
		@log.info "title: " + title

		@titleID = titleID
		@title = title
		@songs = []
		@webpages = {}
		
		@log.info "[class CD] initialize finish"
	end	
	
	def write_song_list_to(file, charset="UTF-8")
		@log.info "[class CD] write_song_list_to start"
		@log.info "CD title: "+@title
		@log.info "write to "+file
		@log.info "charset: " + charset
		
		f = open(file,"w+:"+charset)
		f.print "title,",@title,"\n"
		f.print "songs,",@songs.size,"\n"
		i = 1
		@songs.each do |song|
			f.print i,",",song,"\n"
			i += 1
		end
		f.close
		
		@log.info "[class CD] write_song_list_to finished"
	end
	
end

