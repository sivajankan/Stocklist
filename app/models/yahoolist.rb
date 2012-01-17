class Yahoolist < ActiveRecord::Base
require 'yahoofinance'

  def self.allcodes
    @stockcodes ||= Stocklist.codesonly.map {|element| "#{element['code']}"}.join(',')
  end
  
  def self.stdstocks (sort)
     puts "sort info: #{sort}"
     quote_type = YahooFinance::StandardQuote
     quote_symbols = allcodes
     stdstocks = YahooFinance::get_quotes( quote_type, quote_symbols )
     if (sort == "symbol")
       stdstocks = Hash[stdstocks.sort]
     elsif (sort == 'lastTrade')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.lastTrade}
     elsif (sort == 'name')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.name}
     end
     stdstocks
  end
  
  def self.allstocks 
     quote_type = YahooFinance::ExtendedQuote
     quote_symbols = allcodes
     allstocks = YahooFinance::get_quotes( quote_type, quote_symbols )
  end
  
  def self.extstocks (sort)
     #quote_type = YahooFinance::ExtendedQuote
     #quote_symbols = allcodes
     #YahooFinance::get_quotes( quote_type, quote_symbols ) 
     puts "sort info: #{sort}"
     quote_type = YahooFinance::ExtendedQuote
     quote_symbols = allcodes
     stdstocks = YahooFinance::get_quotes( quote_type, quote_symbols )
     if (sort == "symbol")
       stdstocks = Hash[stdstocks.sort]
     elsif (sort == 'lastTrade')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.lastTrade}
     elsif (sort == 'name')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.name}
     elsif (sort == 'pe')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.peRatio}
     elsif (sort == 'eps')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.earningsPerShare}
     elsif (sort == 'pegratio')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.pegRatio}.reverse
     elsif (sort == 'bookValue')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.bookValue}
     elsif (sort == 'pricePerBook')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.pricePerBook}
     elsif (sort == 'dividendYield')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.dividendYield}
     elsif (sort == 'dividendPerShare')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.dividendPerShare}
     elsif (sort == 'movingAve50days')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.movingAve50days}
     elsif (sort == 'movingAve200days')
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.movingAve200days}
     end
     stdstocks
  end
  
  def self.sectors
    sectors = Hash.new(0)
    Stocklist.sectoronly.each do |code|
      sectors[code.code] = code.sector
    end
    sectors
  end
end
