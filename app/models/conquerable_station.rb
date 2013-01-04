class ConquerableStation
  @stationID
  @stationName
  @stationTypeID
  @solarSystemID
  @corporationID
  @corporationName

  def self.GetStation(locationID)
    conqStation = ConquerableStation.new

    apiE = API.GetApi("eve")

    locID = locationID.to_f
    if locID >=  67000000  && locID < 68000000
      #Player owned station
      stationID = locID -  6000000

      apiE.ConquerableStationList.outposts.each { |outpost|
        if outpost.stationID.to_s == stationID.to_s
          conqStation.stationName = outpost.stationName
          conqStation.stationID = outpost.stationID
          conqStation.stationTypeID = outpost.stationTypeID
          conqStation.solarSystemID = outpost.solarSystemID
          conqStation.corporationID = outpost.corporationID
          conqStation.corporationName = outpost.corporationName
          break
        end
      }
    end
    return conqStation
  end
end