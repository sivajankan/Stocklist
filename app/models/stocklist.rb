class Stocklist < ActiveRecord::Base
  require 'yahoofinance'

  scope :symbolsonly, select('symbol')
  scope :sectoronly, select('symbol, sector')
  scope :sector, lambda { where("sector =", sector) }



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
