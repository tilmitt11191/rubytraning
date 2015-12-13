
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "html_manager.rb"

class Singer
	#var
	@log
	@name
	@CDs #CD array[]
	@songs #hash[] key=song, value=CDtitle1,CDtitle2,...
	attr_reader :name
	attr_reader :CDs
	attr_reader :songs
	
	def initialize(name)
		@log = Logger.new("etc/log")
		@log.info "[class Singer] initialize start"
		@log.info "name: "+name
		@name = name
		@CDs = []
		@songs = {}
		@log.info "[class Singer] initialize finished"
	end	
	
	def add_cd(cd)
		@log.info "[class Singer] add_cd start"
		@CDs.push cd
		
		cd.songs.each do |song|
			if @songs.has_key?(song)
				@songs[song] = @songs[song].to_s + "," + cd.title.to_s
				@log.info "@songs[" + song.to_s + "] = " + @songs[song].to_s
			else
				@songs[song] = cd.title.to_s
				@log.info "@songs[" + song.to_s + "] = " + @songs[song].to_s
			end
		end
		
		@log.info "[class Singer] add_cd finished"
	end
	
	def create_song_list(title)
		@log.info "[class Singer] create_song_list start"
		# no such title
		@log.info "[class Singer] create_song_list finished"
	end
	
	def create_all_song_list_to(file, charset="UTF-8")
		@log.info "[class Singer] create_all_song_list_to start"
		@log.info "write to "+file
		@log.info "charset: " + charset
		
		f = open(file,"w+:"+charset)
		@songs.each do |song, cds|
			@log.info "writing "+song.to_s+", "+cds.to_s
			f.print song.to_s + "," + cds.to_s + "\n"
		end
		
		f.close
		
		@log.info "[class Singer] create_all_song_list_to finished"
	end

end