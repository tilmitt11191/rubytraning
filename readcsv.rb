
print "readcsv.rb start\n"
require "csv" 

#src = "this is readcsv\n"
str = "this is" << "\n" + "readcsv" * 2 + "\n"
print(str, "\n")

#csv_line_read02=[]
csv_line_read01 = CSV.open("data/null-output.csv")
puts #(csv_line_read01)
puts #(csv_line_read01[])

#arr = [123, 456, 789]
#puts csv_line_read01

print "\nend\n"
