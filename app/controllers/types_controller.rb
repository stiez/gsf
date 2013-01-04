class TypesController < ApplicationController
  # GET /types
  # GET /types.json
  def index
    if params[:term]
      types = Type.all(:conditions => ['typeName LIKE ?', "%#{params[:term]}%"], :limit => 10)
    else
      types = Type.joins(:group => :category).where("invCategories.published = 1 AND invCategories.categoryID <> 2 AND invCategories.categoryID <> 46")
    end
    @types = []
    types.each{ |type|
      t = DisplayType.new
      t.value = type.typeID
      t.label = type.name
      @types.push(t)
    }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @types }
    end
  end

  # GET /types/1
  # GET /types/1.json
  def show
    if params[:term]
      @types = Type.all(:conditions => ['typeName LIKE ?', "%#{params[:term]}%"])
    else
      @type = Type.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @types }
    end
  end
end
