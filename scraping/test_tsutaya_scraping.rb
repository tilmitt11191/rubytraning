
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
#### test of create_CD
#@searched_pages = create_serched_pages(@search_Carpenters_url, @cookie, @default_charset)
#@html =  @searched_pages[0]
#@cd_list = create_CD(@html)
#@cd_list.each do |cd|
#	p cd.title
#end

#### test of get_songs
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


#### test of write_song_list_to(file)
#@cd_with_songs.write_song_list_to("songlist.csv")
#@cd_with_songs.write_song_list_to("songlist.csv","Shift_JIS")

####test of add_cd
#@carpenters = Singer.new("Carpenters")
#@carpenters.add_cd(@cd_with_songs)
#p @carpenters.CDs.size
#@carpenters.create_all_song_list_to("carpenters.csv", "Shift_JIS")



@log.info "test_tsutaya_scraping.rb main finished"
exit 0

=begin
@cookie = "~/Library/Application\ Support/Google/Chrome/Default/Cookies"
@default_charset="Shift_JIS"
#@top_url="http://movie-tsutaya.tsite.jp/netdvd/vod/top.do"
#@tsutaya_top = HTML_manager.new(@top_url, @cookie, @default_charset)

#@serch_top_url="http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do"
#@serch_top = HTML_manager.new(@serch_top_url, @cookie, @default_charset)
#@serch_top.output_input_file("output.txt")

@serch_Carpenters_url="http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?k=%83J%81%5B%83y%83%93%83%5E%81%5B%83Y"
@serch_Carpenters=HTML_manager.new(@serch_Carpenters_url, @cookie, @default_charset)
@serch_Carpenters.output_input_file("output.txt")
@carpenters=Singer_manager.new("carpenters", @serch_Carpenters)
@carpenters.print_discography

#@cd1=HTML_manager.new("http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID=0001308338",@cookie,@default_charset)
#@cd1.output_input_file("0001308338.txt")
#@cd2=HTML_manager.new("http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID=1128488787",@cookie,@default_charset)
#@cd2.output_input_file("1128488787.txt")

@last=HTML_manager.new("http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?K=%83%4A%81%5B%83%79%83%93%83%5E%81%5B%83%59&SRT=a&PN=6",@cookie,@default_charset)
@last.output_input_file("pn6.txt")

#@serch_Carpenters.each do |line|
#	if line.include?("titileID")
#		print line
#	end
#end

#@title_array = @serch_Carpenters.input_file.css('.tblColType01Cell01').css('a')
#@title_array.each do |title|
#	print title,"\n"
#end

#http://movie-tsutaya.tsite.jp/netdvd/vod/top.do
#http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?k=%83J%81%5B%83y%83%93%83%5E%81%5B%83Y
#http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?K=%83%4A%81%5B%83%79%83%93%83%5E%81%5B%83%59&PN=2
#http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID=0000137797
=end
