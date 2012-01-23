class Stocklist < ActiveRecord::Base
  require 'yahoofinance'

  scope :symbolsonly, select('symbol').where("symbol like 'B%'")
  scope :sectoronly, select('symbol, sector')
  scope :industryonly, select('symbol, industry')
  scope :sectorindustry, select('symbol, sector, industry')
  scope :sector, lambda { where("sector =", sector) }
  scope :industry, lambda { where("industry=", industry)}



=begin  
  def lastTrade(symbol)
     quotes = YahooFinance::get_standard_quotes(symbol)
     quotes[symbol].lastTrade   
  end
  
  def peValue(symbol)
     quotes = YahooFinance::get_extended_quotes(symbol)
     quotes[symbol].peRatio   
  end
  
  def epsValue(symbol)
     quotes = YahooFinance::get_extended_quotes(symbol)
     quotes[symbol].earningsPerShare
  end

  def pegRatio(symbol)
     quotes = YahooFinance::get_extended_quotes(symbol)
     quotes[symbol].pegRatio
  end
=end
end
