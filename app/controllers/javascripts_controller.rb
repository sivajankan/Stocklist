class JavascriptsController < ApplicationController
  #FIXME NOT_USED
  def dynamic_sector
    @sectors = Stocklist.sectorlistall
    @industry = Stocklist.industrylist
  end

end
