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
 
 Struct.new("Row",:year, :hg, :sg, :rf, :other, :combo, :noreport, :unknown)
f.each {|x| print x}