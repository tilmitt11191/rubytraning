
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require	"logger"

require_relative "singer.rb"
require_relative "get_song_list_from_website.rb"
include Get_song_list_from_website_tsutaya

## main
@log = Logger.new("etc/log")
@log.info "\n\ntsutaya_scraping.rb main start"

@singer = Singer.new("Carpenters")
@search_Carpenters_url="http://movie-tsutaya.tsite.jp/netdvd/cd/searchCd.do?k=%83J%81%5B%83y%83%93%83%5E%81%5B%83Y"
@cookie = "~/cdrive_work/Users/tilmi_000/AppData/Local/Google/Chrome/User\ Data/Profile\ 1/Cookies"
@default_charset="Shift_JIS"

@searched_pages = create_serched_pages(@search_Carpenters_url, @cookie, @default_charset)

@searched_pages.each do |html|
	cd_list = create_CD(html)
	cd_list.each do |cd|
		@singer.add_cd( get_songs(cd) )
	end
end

@singer.create_all_song_list_to("carpenters.csv", "Shift_JIS")

@log.info "test_tsutaya_scraping.rb main finished"
exit 0
