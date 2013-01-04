class API
  require 'eaal'

  @userID = "1203693"
  @key = "wtxRaIyy13ah9LGiUbPC7Wy12YcsmAiZhO6v38545aP5PdOI9UDHIeZG1Xz4O0fl"

  public
  def GetStationId(locationID)



  end

  def self.GetApi(scope = "account")
    EAAL.cache = EAAL::Cache::FileCache.new()
    return EAAL::API.new(@userID, @key, scope)
  end
end