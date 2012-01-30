# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts("Populating NASDAQ Stocks")
csv_nasdaq = CSV.parse(File.read("#{Rails.root}/db/NASDAQ_companylist.csv"), :headers => true)
csv_nasdaq.each do |row| 
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


puts("Populating NYSE Stocks")
csv_nyse = CSV.parse(File.read("#{Rails.root}/db/NYSE_companylist.csv"), :headers => true)
csv_nyse.each do |row| 
  puts row["Symbol"] + ", " + row["Name"] + ", " + row["MarketCap"] + ", " + row["IPOyear"] + ", " + row["Sector"] + "-" + row["industry"]
  stock = Stocklist.find_or_create_by_symbol(row["Symbol"])
  stock.symbol = row["Symbol"]
  stock.name = row["Name"]
  stock.sector = row["Sector"]
  stock.industry = row["industry"]
  stock.marketcap = row["MarketCap"]
  stock.ipoyear = row["IPOyear"]
  stock.stockexchange = "NYSE"
  stock.save!
end


puts("Populating AMEX Stocks")
csv_amex = CSV.parse(File.read("#{Rails.root}/db/AMEX_companylist.csv"), :headers => true)
csv_amex.each do |row| 
  puts row["Symbol"] + ", " + row["Name"] + ", " + row["MarketCap"] + ", " + row["IPOyear"] + ", " + row["Sector"] + "-" + row["industry"]
  stock = Stocklist.find_or_create_by_symbol(row["Symbol"])
  stock.symbol = row["Symbol"]
  stock.name = row["Name"]
  stock.sector = row["Sector"]
  stock.industry = row["industry"]
  stock.marketcap = row["MarketCap"]
  stock.ipoyear = row["IPOyear"]
  stock.stockexchange = "AMEX"
  stock.save!
end


