
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "singer.rb"
require_relative "get_song_list_from_website.rb"
include Get_song_list_from_website_tsutaya


## main
@log = Logger.new("etc/log")
@log.info "\n\ntsutaya_scraping.rb main start"

@singer = "Carpenters"
@search_Carpenters_url="http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?k=%83J%81%5B%83y%83%93%83%5E%81%5B%83Y"
@cookie = "~/cdrive_work/Users/tilmi_000/AppData/Local/Google/Chrome/User\ Data/Profile\ 1/Cookies"
@default_charset="Shift_JIS"

#################################
## html sample
@test_url="http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?k=%83J%81%5B%83y%83%93%83%5E%81%5B%83Y"
@cookie = "~/cdrive_work/Users/tilmi_000/AppData/Local/Google/Chrome/User\ Data/Profile\ 1/Cookies"
@default_charset="Shift_JIS"
@html = HTML_manager.new(@test_url, @cookie, @default_charset, "test_tsutaya-discas", "cd")

## cd sample
@cd = CD.new("1128488787", "40/40")
@cd.webpages["tsutaya-discas"] = @html


#################################
#### test of create_serched_pages
@searched_pages = create_serched_pages(@search_Carpenters_url, @cookie, @default_charset)
@searched_pages.each do |page|
	p page.get_title
	p page.input_url
end


#### test of create_CD
=begin
#@searched_pages = create_serched_pages(@search_Carpenters_url, @cookie, @default_charset)
#@html =  @searched_pages[0]
#@cd_list = create_CD(@html)
#@cd_list.each do |cd|
#	p cd.title
#end
=end

#### test of get_songs
=begin
@test_url="http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID=1128488787"
@cookie = "~/cdrive_work/Users/tilmi_000/AppData/Local/Google/Chrome/User\ Data/Profile\ 1/Cookies"
@default_charset="Shift_JIS"
@html = HTML_manager.new(@test_url, @cookie, @default_charset, "test_tsutaya-discas", "cd")
@cd = CD.new("1128488787", "40/40")
@cd.webpages["tsutaya-discas"] = @html
@html.output_input_file("output.txt")

@cd_with_songs = get_songs(@cd)
#p @cd_with_songs.title
#@cd_with_songs.songs.each do |song|
	#p song
#end

@cd_with_songs = format_song_list(@cd_with_songs)
@cd_with_songs.songs.each do |song|
	p song
end
=end

#### test of write_song_list_to(file)
=begin
#@cd_with_songs.write_song_list_to("songlist.csv")
#@cd_with_songs.write_song_list_to("songlist.csv","Shift_JIS")

####test of add_cd
#@carpenters = Singer.new("Carpenters")
#@carpenters.add_cd(@cd_with_songs)
#p @carpenters.CDs.size
#@carpenters.create_all_song_list_to("carpenters.csv", "Shift_JIS")
=end


@log.info "test_tsutaya_scraping.rb main finished"
exit 0
