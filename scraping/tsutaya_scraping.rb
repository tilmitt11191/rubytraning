
#ruby 2.0.0
require_relative "html_manager.rb"

## main
@cookie = "~/Library/Application\ Support/Google/Chrome/Default/Cookies"
@top_url="http://movie-tsutaya.tsite.jp/netdvd/vod/top.do"
@tsutaya_top = HTML_manager.new(@top_url, @cookie)
#@tsutaya_top.print_input_file
@tsutaya_top.output_row_data("output.txt")