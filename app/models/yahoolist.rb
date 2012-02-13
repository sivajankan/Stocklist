class Yahoolist < ActiveRecord::Base
require 'yahoofinance'

  def self.allsymbols
    @stockcodes ||= Stocklist.symbolsonly.map {|element| "#{element['symbol']}"}.join(',')
  end
  
  def self.limitedsymbols(exchange, sector, industry)
    cond_industry = (industry != "__ALL__") ? "and industry='#{industry}'" : ""
    @stockcodes ||= Stocklist.symbolsonly.where("stockexchange='#{exchange}' and sector='#{sector}' #{cond_industry}").map {|element| "#{element['symbol']}"}.join(',')
  end
  
  def self.limitedstocks(exchange, sector, industry)
     quote_symbols = limitedsymbols(exchange, sector, industry)
     quote_symbols.gsub(/\s+/, "").strip
     #puts "limited_symbols" + quote_symbols
     allstocks = YahooFinance::get_quotes( YahooFinance::ExtendedQuote, quote_symbols )
  end
  
  def self.pagedstocks(exchange, sector, industry)
    cond_exchange = (exchange != "__ALL__") ? "stockexchange='#{exchange}' and " : ""
    cond_industry = (industry != "__ALL__") ? "and industry='#{industry}'" : ""
    @stockcodes = Stocklist.select("symbol").where("#{cond_exchange} sector='#{sector}' #{cond_industry}").page(1)
    for i in 1..@stockcodes.num_pages
      @symbols ||= @stockcodes.page(i).per(200).map {|el| "#{el['symbol'].gsub(/\s+/, "").strip.sub("^", "")}"}.join(',')
      @symbols.gsub(/\s+/, "").strip
      puts "Page: #{i} #{@symbols}"
      retstocks ||= YahooFinance::get_quotes( YahooFinance::ExtendedQuote, @symbols )
    end
    retstocks
  end
  
  def self.stdstocks (sort)
     puts "sort info: #{sort}"
     quote_type = YahooFinance::StandardQuote
     quote_symbols = allsymbols
     stdstocks = YahooFinance::get_quotes( quote_type, quote_symbols )
     if (sort == "symbol")
       stdstocks = Hash[stdstocks.sort]
     elsif (sort == "lastTrade")
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.lastTrade}
     elsif (sort == "name")
       stdstocks = stdstocks.sort_by {|symbol, qt| qt.name}
     end
     stdstocks
  end
  
  def self.allstocks 
     quote_type = YahooFinance::ExtendedQuote
     quote_symbols = allsymbols
     quote_symbols.gsub(/\s+/, "").strip
     #puts "quote_symbols" + quote_symbols
     allstocks = YahooFinance::get_quotes( quote_type, quote_symbols )
  end
  
  def self.extstocks (sort)
     #quote_type = YahooFinance::ExtendedQuote
     #quote_symbols = allcodes
     #YahooFinance::get_quotes( quote_type, quote_symbols ) 
     puts "sort info: #{sort}"
     quote_type = YahooFinance::ExtendedQuote
     quote_symbols = allsymbols
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
    Stocklist.sectoronly.each do |list|
      sectors[list.symbol] = list.sector
    end
    sectors
  end
  
  def self.industries
    industry = Hash.new(0)
    Stocklist.industryonly.each do |list|
      industry[list.symbol] = list.industry
    end
    industry
  end


  def self.sectorindustry
    sectorindustry = Hash.new(0)
    Stocklist.sectorindustry.each do |list|
      sectorindustry[list.symbol] = "#{list.sector}-#{list.industry}"
    end
    sectorindustry
  end
end
