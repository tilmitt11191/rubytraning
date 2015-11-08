
print "readcsv.rb start\n"
require "csv" 
#/cygdrive/f/Dropbox/pc/workingtower/home/dropbox/program/ruby/rubytraning

str = "this is" << "\n" + "readcsv" * 2 + "\n"
print(str, "\n")

CSV.foreach("null-output.csv") do |row|
	print row
end


#csv_line_read02=[]
#csv_line_read01 = []
#CSV.open("data/null-output.csv")
#puts #(csv_line_read01)
#puts #(csv_line_read01[])

#arr = [123, 456, 789]
#puts csv_line_read01

print "\nend\n"
