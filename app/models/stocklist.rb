class Stocklist < ActiveRecord::Base
  require 'yahoofinance'

  scope :codesonly, select('code')
  scope :sectoronly, select('code, sector')
  scope :sector, lambda { where("sector =", sector) }



=begin  
  def lastTrade(code)
     quotes = YahooFinance::get_standard_quotes(code)
     quotes[code].lastTrade   
  end
  
  def peValue(code)
     quotes = YahooFinance::get_extended_quotes(code)
     quotes[code].peRatio   
  end
  
  def epsValue(code)
     quotes = YahooFinance::get_extended_quotes(code)
     quotes[code].earningsPerShare
  end

  def pegRatio(code)
     quotes = YahooFinance::get_extended_quotes(code)
     quotes[code].pegRatio
  end
=end
end
