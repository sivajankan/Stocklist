class YahoolistsController < ApplicationController
  # GET /yahoolists
  # GET /yahoolists.json
  def index
    @yahoolists = Yahoolist.all
 
    #TODO 
    #Collect stock quotes for all together
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yahoolists }
    end
  end

  # GET /yahoolists/1
  # GET /yahoolists/1.json
  def show
    @yahoolist = Yahoolist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yahoolist }
    end
  end

  # GET /yahoolists/new
  # GET /yahoolists/new.json
  def new
    @yahoolist = Yahoolist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yahoolist }
    end
  end

  # GET /yahoolists/1/edit
  def edit
    @yahoolist = Yahoolist.find(params[:id])
  end

  # POST /yahoolists
  # POST /yahoolists.json
  def create
    @yahoolist = Yahoolist.new(params[:yahoolist])

    respond_to do |format|
      if @yahoolist.save
        format.html { redirect_to @yahoolist, notice: 'Yahoolist was successfully created.' }
        format.json { render json: @yahoolist, status: :created, location: @yahoolist }
      else
        format.html { render action: "new" }
        format.json { render json: @yahoolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yahoolists/1
  # PUT /yahoolists/1.json
  def update
    @yahoolist = Yahoolist.find(params[:id])

    respond_to do |format|
      if @yahoolist.update_attributes(params[:yahoolist])
        format.html { redirect_to @yahoolist, notice: 'Yahoolist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @yahoolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yahoolists/1
  # DELETE /yahoolists/1.json
  def destroy
    @yahoolist = Yahoolist.find(params[:id])
    @yahoolist.destroy

    respond_to do |format|
      format.html { redirect_to yahoolists_url }
      format.json { head :ok }
    end
  end
  
end
