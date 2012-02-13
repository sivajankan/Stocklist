class Stocklist < ActiveRecord::Base
 # require 'yahoofinance'

  scope :symbolsonly, select('symbol')
  scope :sectoronly, select('symbol, sector')
  scope :industryonly, select('symbol, industry')
  scope :sectorindustry, select('symbol, sector, industry')
  scope :sector, lambda { where("sector =", sector) }
  scope :industry, lambda { where("industry=", industry)}
  scope :sectorlist, select('stockexchange, sector').group('stockexchange, sector')
  scope :industrylist, select('stockexchange, sector, industry').group('stockexchange, sector, industry')
  scope :exchangelist, select('stockexchange').group('stockexchange')

  def self.exchangelistall 
    @stockexchange = self.exchangelist
    @stockexchange += Stocklist.select("'__ALL__' as stockexchange").limit(1)
  end
  
  def self.sectorlistall
    @sector = Stocklist.sectorlist
    @sector += Stocklist.select("sector, '__ALL__' as stockexchange").group("sector")
  end
  
  def self.industrylistall
    @sector = Stocklist.sectorlist
    @industry = Stocklist.industrylist
    @industry += Stocklist.select("sector, industry, '__ALL__' as stockexchange").group("sector, industry")
    #@sector.each do |sec|
    #   @industry += Stocklist.select("'#{sec.stockexchange}' as stockexchange, '#{sec.sector}' as sector, '__ALL__' as industry").limit(1)
    #end
  end
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
