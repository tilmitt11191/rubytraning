

print "readcsv.rb start\n"
require "csv" 

str = "this is" << "\n" + "csv_reader" * 2 + "\n"
print(str, "\n")

CSV.foreach("data/null-output.csv", encoding: "Shift_JIS:UTF-8") do |row|
	print row
end

class A
	def one
		2	
	end
end

a = A.new
p a.one

#csv_line_read02=[]
#csv_line_read01 = []
#CSV.open("data/null-output.csv")
#puts #(csv_line_read01)
#puts #(csv_line_read01[])

#arr = [123, 456, 789]
#puts csv_line_read01

print "\nend\n"
