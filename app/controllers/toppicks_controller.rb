class ToppicksController < ApplicationController
  # GET /toppicks
  # GET /toppicks.json
  def index
    @toppicks = Toppick.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @toppicks }
    end
  end

  # GET /toppicks/1
  # GET /toppicks/1.json
  def show
    @toppick = Toppick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @toppick }
    end
  end

  # GET /toppicks/new
  # GET /toppicks/new.json
  def new
    @toppick = Toppick.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @toppick }
    end
  end

  # GET /toppicks/1/edit
  def edit
    @toppick = Toppick.find(params[:id])
  end

  # POST /toppicks
  # POST /toppicks.json
  def create
    @toppick = Toppick.new(params[:toppick])

    respond_to do |format|
      if @toppick.save
        format.html { redirect_to @toppick, notice: 'Toppick was successfully created.' }
        format.json { render json: @toppick, status: :created, location: @toppick }
      else
        format.html { render action: "new" }
        format.json { render json: @toppick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /toppicks/1
  # PUT /toppicks/1.json
  def update
    @toppick = Toppick.find(params[:id])

    respond_to do |format|
      if @toppick.update_attributes(params[:toppick])
        format.html { redirect_to @toppick, notice: 'Toppick was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @toppick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toppicks/1
  # DELETE /toppicks/1.json
  def destroy
    @toppick = Toppick.find(params[:id])
    @toppick.destroy

    respond_to do |format|
      format.html { redirect_to toppicks_url }
      format.json { head :ok }
    end
  end
  
  def addpicks
    newpicks = params[:newpicks]
    todaydate = Date.today
    @added = ""
    #split ran throw each entry
    newpicks.split('~').each do |el| 
      el.match(/-/)
      @toppick = Toppick.new
      @toppick.symbol = $`
      @toppick.lasttrade = $'
      @toppick.pickeddate = todaydate
      @toppick.save
      @added ||= @toppick
    end
    
    respond_to do |format|
      format.html { redirect_to :addpicks_path }
      format.json { render json: "Success",status: :ok }
    end  
  end
  
  def yahooindex
    @stocks = Yahoolist.toppickedstocks(params[:pickeddate])
    @pickeddate = Toppick.pickeddateonly
    @exchanges = Toppick.exchanges
    @lasttrades = Toppick.lasttrades
    
    respond_to do |format|
      format.html # yahooindex.html.erb
      format.json { render json: @stocks }
    end
  end
end
