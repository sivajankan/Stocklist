class StocklistsController < ApplicationController
  # GET /stocklists
  # GET /stocklists.json
  def index
    @stocklists = Stocklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocklists }
    end
  end

  # GET /stocklists/1
  # GET /stocklists/1.json
  def show
    @stocklist = Stocklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stocklist }
    end
  end

  # GET /stocklists/new
  # GET /stocklists/new.json
  def new
    @stocklist = Stocklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stocklist }
    end
  end

  # GET /stocklists/1/edit
  def edit
    @stocklist = Stocklist.find(params[:id])
  end

  # POST /stocklists
  # POST /stocklists.json
  def create
    @stocklist = Stocklist.new(params[:stocklist])

    respond_to do |format|
      if @stocklist.save
        format.html { redirect_to @stocklist, notice: 'Stocklist was successfully created.' }
        format.json { render json: @stocklist, status: :created, location: @stocklist }
      else
        format.html { render action: "new" }
        format.json { render json: @stocklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stocklists/1
  # PUT /stocklists/1.json
  def update
    @stocklist = Stocklist.find(params[:id])

    respond_to do |format|
      if @stocklist.update_attributes(params[:stocklist])
        format.html { redirect_to @stocklist, notice: 'Stocklist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @stocklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocklists/1
  # DELETE /stocklists/1.json
  def destroy
    @stocklist = Stocklist.find(params[:id])
    @stocklist.destroy

    respond_to do |format|
      format.html { redirect_to stocklists_url }
      format.json { head :ok }
    end
  end
end
