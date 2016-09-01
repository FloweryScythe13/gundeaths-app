require 'daru'
require 'statsample'
require 'csv'

##The variables used in this data set are: Year [2003-2013], Sex of Deceased [M-F], Firearm Type [Handgun, Shotgun, Rifle, Other, Combination, Not Reported, 
##Unknown], and Race [White, Black, Am Indian/AK Native, Asian/Pac Islander, Unknown/Other]. Each cell value is then given in both number and percent-of-total format.
 puts Dir.pwd
 puts File.exists?("output_2.csv")
 f = CSV.read("output_2.csv")



