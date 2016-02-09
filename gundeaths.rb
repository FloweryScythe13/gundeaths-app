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
		 
		
		
	end
end

def compareYears(y1, y2, weapon1, weapon2=weapon1)
	unless (( (2003..2013) === y1.to_i) && ((2003..2013) === y2.to_i))
		raise ArgumentError, "Year(s) selected for comparison must be between 2003 and 2013."
	end 
	##Get the values for the selected categories from the selected years and print them.
	weapon1 = weapon1.downcase
	weapon2 = weapon2.downcase
	weapon1bool = false
	weapon2bool = false
	Row.each do |x|
		weapon1bool = true if weapon1 === x 
		weapon2bool = true if weapon2 === x 
	end
	unless weapon1bool == true && weapon2bool == true
		raise ArgumentError, "Firearm selection must match one of the options given in the data. \nAvailable options are "\
		"Hg, sg, rf, other, combo, noreport, and unknown. They are not caps sensitive."
	end
	i = nil;
	j = nil;
	for index in 0..records.length do 
		i = index if records[index][:year] == y1 
		
		j = index if records[index][:year] == y2
		
	end
	
	puts "#{y1}: There were #{records[i]["#{weapon1}"]} fatalities involving a #{weapon1}."
	puts "#{y2}: There were #{records[i]["#{weapon2}"]} fatalities involving a #{weapon2}."

end

puts f[2][2]
row2003 = Row.new(f[1])
records = Array.new()
f.each {|x| records.push(Row.new(x))}
puts records.inspect
compareYears(2004, 2005, "hg")
