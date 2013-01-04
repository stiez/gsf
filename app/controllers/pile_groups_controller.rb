class PileGroupsController < ApplicationController
  # GET /pile_groups
  # GET /pile_groups.json
  def index
    @pile_groups = PileGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pile_groups }
    end
  end

  # GET /pile_groups/1
  # GET /pile_groups/1.json
  def show
    @pile_group = PileGroup.find(params[:id])
    @corpStations = getCorpOffices

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pile_group }
    end
  end

  # GET /pile_groups/new
  # GET /pile_groups/new.json
  def new
    @pile_group = PileGroup.new
    @corpStations = getCorpOffices

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pile_group }
    end
  end

  # GET /pile_groups/1/edit
  def edit
    @pile_group = PileGroup.find(params[:id])
    @corpStations = getCorpOffices
  end

  # POST /pile_groups
  # POST /pile_groups.json
  def create
    @pile_group = PileGroup.new(params[:pile_group])

    respond_to do |format|
      if @pile_group.save
        format.html { redirect_to @pile_group, notice: 'Pile group was successfully created.' }
        format.json { render json: @pile_group, status: :created, location: @pile_group }
      else
        format.html { render action: "new" }
        format.json { render json: @pile_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pile_groups/1
  # PUT /pile_groups/1.json
  def update
    @pile_group = PileGroup.find(params[:id])

    respond_to do |format|
      if @pile_group.update_attributes(params[:pile_group])
        format.html { redirect_to @pile_group, notice: 'Pile group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pile_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pile_groups/1
  # DELETE /pile_groups/1.json
  def destroy
    @pile_group = PileGroup.find(params[:id])
    @pile_group.destroy

    respond_to do |format|
      format.html { redirect_to pile_groups_url }
      format.json { head :no_content }
    end
  end

  def getCorpOffices
    locationIDs = []
    apiC = API.GetApi("corp")
    apiC.AssetList.assets.each do |asset|
      if asset.typeID.to_s == "27"
        locationIDs.push(asset.locationID)
      end
    end

    corpOffices = {}
    #corpOffices["Key"] = "Value"

    apiE = API.GetApi("eve")
    locationIDs.each{ |locationID|
      locID = locationID.to_f
      if locID >= 66000000 && locID < 67000000
        #NPC station
        stationID = locID -  6000001
        sta = Station.find(stationID)

        if(!sta.nil?)
          corpOffices[stationID] = sta.name
        end
      elsif locID >=  67000000  && locID < 68000000
        #Player owned station
        stationID = locID -  6000000

        apiE.ConquerableStationList.outposts.each { |outpost|
          if outpost.stationID.to_s == stationID.to_s
            corpOffices[stationID] = outpost.stationName
            break
          end
        }
      end
    }

    return corpOffices
  end


end
