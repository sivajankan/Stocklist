class Toppick < ActiveRecord::Base
  scope :pickeddateonly, select('pickeddate').group('pickeddate').order('pickeddate DESC')
  
  #TODO: Use lambda to sync the functions
  def self.exchanges
    exchanges = Hash.new(0)
    Stocklist.select('symbol, stockexchange').each do |list|
      exchanges[list.symbol] = list.stockexchange
    end
    exchanges
  end
  
  def self.lasttrades
    lasttrades = Hash.new(0)
    Toppick.select('symbol, lasttrade').each do |list|
      lasttrades[list.symbol] = list.lasttrade
    end
    lasttrades
  end
end
