
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "singer.rb"
require_relative "get_song_list_from_website.rb"
include Get_song_list_from_website_tsutaya

## main
@log = Logger.new("etc/log")
@log.info "\n\ntsutaya_scraping_a_cd.rb main start"

@singer = Singer.new("Carpenters")
@cd_title = "top of the world"
@cd_titleID="0001172753"
@cookie = "~/cdrive_work/Users/tilmi_000/AppData/Local/Google/Chrome/User\ Data/Profile\ 1/Cookies"
@charset="Shift_JIS"


@cd = CD.new(@cd_titleID, @cd_title)
@cd_url = "http://movie-tsutaya.tsite.jp/netdvd/cd/goodsDetail.do?pT=null&titleID="+@cd_titleID

@cd.webpages["tsutaya-discas"] = HTML_manager.new(@cd_url, @cookie, @charset, "tsutaya-discas", @cd_titleID)
@cd = get_songs(@cd)

@cd.webpages["tsutaya-discas"].output_input_file(@cd_titleID+".txt")
@cd.write_song_list_to(@cd_titleID+".csv","Shift_JIS")


@singer.add_cd(@cd)
@singer.create_all_song_list_to(@singer.name + "-" + @cd_titleID+".csv", "Shift_JIS")


@log.info "tsutaya_scraping_a_cd.rb finished"
exit 0
