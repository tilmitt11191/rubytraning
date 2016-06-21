
#ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]
require_relative "HTML_manager.rb"

cookie = "~/f/Dropbox/pc/cookies/cookies_chrome"
default_charset="Shift_JIS"

url_of_toppage="https://www.nhk-ondemand.jp/user/availableList/index.html"
toppage=HTML_manager.new(url_of_toppage, cookie, default_charset, "toppage", "")
toppage.print_input_file
toppage.output_input_file("data/toppage.html")

url_of_toppage="https://www.nhk-ondemand.jp/share/missed/#/a/1/3/"
minogashi=HTML_manager.new(url_of_toppage, cookie, default_charset, "minogashi", "")
minogashi.print_input_file
minogashi.output_input_file("data/minogashi.html")

#url_of_minogashi="https://www.nhk-ondemand.jp/share/missed/#/r/1/0/"
#minogashi=HTML_manager.new(url_of_minogashi, cookie, default_charset, "minogashi", "")
#minogashi.output_input_file("data/minogashi.html")

