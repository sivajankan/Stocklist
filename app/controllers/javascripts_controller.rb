class JavascriptsController < ApplicationController
  #FIXME NOT USED
  def dynamic_sectors_for_exchange
    @sectors = Stocklist.sectorlist
  end
  
  #FIXME NOT USED
  def dynamic_industry_for_sectors
    @industry = Stocklist.industrylist
  end
end
