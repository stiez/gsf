class PilesController < ApplicationController
  # GET /piles
  # GET /piles.json
  def index
    @piles = Pile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @piles }
    end
  end

  # GET /piles/1
  # GET /piles/1.json
  def show
    @pile = Pile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pile }
    end
  end

  # GET /piles/new
  # GET /piles/new.json
  def new
    @pile = Pile.new
    types = Type.joins(:group => :category).where("invCategories.published = 1 AND invCategories.categoryID <> 2 AND invCategories.categoryID <> 46")
      #[ { label: "Choice1", value: "value1" }, ... ]
    @types = "["
    @types << types.collect{ |type| "{ value: %s, label: \"%s\" }" % [type.typeID, type.name] }.join(", ")
    @types <<  "]".html_safe

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pile }
    end
  end

  # GET /piles/1/edit
  def edit
    @pile = Pile.find(params[:id])
    #@types = Type.joins(:group => :category).where(:category => {:published => true && :categoryID <= 2 && :categoryID != 46})
    @types = Type.joins(:group => :category).where("invCategories.published = 1 AND invCategories.categoryID <> 2 AND invCategories.categoryID <> 46")
  end

  # POST /piles
  # POST /piles.json
  def create
    @pile = Pile.new(params[:pile])

    respond_to do |format|
      if @pile.save
        format.html { redirect_to @pile, notice: 'Pile was successfully created.' }
        format.json { render json: @pile, status: :created, location: @pile }
      else
        format.html { render action: "new" }
        format.json { render json: @pile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /piles/1
  # PUT /piles/1.json
  def update
    @pile = Pile.find(params[:id])

    respond_to do |format|
      if @pile.update_attributes(params[:pile])
        format.html { redirect_to @pile, notice: 'Pile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piles/1
  # DELETE /piles/1.json
  def destroy
    @pile = Pile.find(params[:id])
    @pile.destroy

    respond_to do |format|
      format.html { redirect_to piles_url }
      format.json { head :no_content }
    end
  end
end
