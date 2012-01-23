# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts("Populating NASDAQ Stocks")

require 'csv'
csv = CSV.parse(File.read("#{Rails.root}/db/NASDAQ_companylist.csv"), :headers => true)
csv.each do |row| 
  # puts row["Symbol"] + ", " + row["Name"] + ", " + row["MarketCap"] + ", " + row["IPOyear"] + ", " + row["Sector"] + "-" + row["industry"]
  stock = Stocklist.find_or_create_by_symbol(row["Symbol"])
  stock.symbol = row["Symbol"]
  stock.name = row["Name"]
  stock.sector = row["Sector"]
  stock.industry = row["industry"]
  stock.marketcap = row["MarketCap"]
  stock.ipoyear = row["IPOyear"]
  stock.stockexchange = "NASDAQ"
  stock.save!
end

=begin
open("#{Rails.root}/db/NA.txt") do |roles|
  roles.read.each_line do |r|
    name,priority = r.chomp.split("|")
    if name.is_a?(Array)
      name = name[0]
    end
    role = Role.find_or_create_by_name(name)
    role.priority = priority
    role.save
  end
end
=end