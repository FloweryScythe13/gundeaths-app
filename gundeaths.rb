##A Simple Gun Death Statistics App

##The basic idea for this app is to query data on gun deaths in the United States and compare them over a few different quantities, 
##such as year or the type of weapon involved. I will attempt to do this in a simple way by pulling compiled data from Gun Violence Archive's 
##online records via web scraping, followed by manually calculating and displaying the statistical differences in this script. 

require 'daru'
require 'statsample'
require 'csv'

##The variables used in this data set are: Year [2003-2013], Sex of Deceased [M-F], Firearm Type [Handgun, Shotgun, Rifle, Other, Combination, Not Reported, 
##Unknown], and Race [White, Black, Am Indian/AK Native, Asian/Pac Islander, Unknown/Other]. Each cell value is then given in both number and percent-of-total format.
 puts Dir.pwd
 puts File.exists?("output_2.csv")
 f = CSV.read("output_2.csv")
 
 ##It would be best to treat each row of data as a hash table or general dictionary. That way, I can first display the data as a bar graph, with the weapon 
 ##types as categories on the x-axis and the death #'s represented on the y-axis for a given year. If I'm comparing two years, the categories can be shown 
 ##with their bars side by side, as is typical. Later, I can get to displaying specific weapon fatalities over time - but not yet. 
 
Row = Struct.new(:year, :hg, :sg, :rf, :other, :combo, :noreport, :unknown) do
	def initialize(csv)
		unless csv.is_a? Array or csv.is_a? CSV
			raise ArgumentError, "cannot read in spreadsheet data from a #{csv.class}"
		end 
		puts csv
		##Take each value from the csv Array and copy it to the corresponding entry in the Struct
		for index in 0..7 do
			self[index] = csv[index]
		end
		# self[0] = csv[0]
		# self[1] = csv[1]
		# self[2] = csv[2]
		# self[3] = csv[3]
		# self[4] = csv[4]
		# self[5] = csv[5]
		# self[6] = csv[6]
		# self[7] = csv[7] 
		
		
	end
end
f.each {|x| print x}
puts f[2][2]
row2003 = Row.new(f[1])
puts row2003.inspect
