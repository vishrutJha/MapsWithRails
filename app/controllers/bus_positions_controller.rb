class BusPositionsController < ApplicationController
  before_action :set_bus_position, only: [:show, :edit, :update, :destroy]

  # GET /bus_positions
  # GET /bus_positions.json
  def index
    unless params[:bus_id].blank?
      @bus_positions = BusPosition.where(bus_id: params[:bus_id]).page(params[:page]).per(20)
    else
      @bus_positions = BusPosition.all.page(params[:page]).per(20)
    end
  end

  def bus_detail
    @location_set = {}
    if params[:bus_id].blank?
      bus_stops = BusPosition.where("speed = ?", 0).select("distinct latitude, longitude")
    else
      bus_stops = BusPosition.where(bus_id: params[:bus_id]).where("speed = ?", 0).select("distinct latitude, longitude")
    end
    bus_stops.map{|stop| 
      @location_set["#{stop.latitude.round(2)}_#{stop.longitude.round(2)}"] = {lat: stop.latitude.round(2), lng: stop.longitude.round(2)}
    }
    @location_set = @location_set.values
  end

  def freq_positions
    frequent_positions = {}
    top_n = (params[:top_n].blank? ? 25 : params[:top_n].to_i)
    precision = (params[:precision].blank? ? 2 : params[:precision].to_i)

    unless params[:bus_id].blank?
      aggregate_data = BusPosition.where(bus_id: params[:bus_id]).where("speed != ?",0).group(:latitude, :longitude).count
    else
      aggregate_data = BusPosition.where("speed != ?",0).group(:latitude, :longitude).count
    end

    aggregate_data.sort_by{|k,v| v}.reverse!

    puts "Setting for #{top_n} and precision #{precision}"

    # Now we get top n values
    aggregate_data.keys.each do |k| 
      frequent_positions["#{k[0].round(precision)}_#{k[1].round(precision)}"] = {lat: k[0], lng: k[1]}
      if frequent_positions.keys.count > top_n
        break;
      end
    end
    render json: frequent_positions.values
  end

  # GET /bus_positions/1
  # GET /bus_positions/1.json
  def show
  end

  # GET /bus_positions/new
  def new
    @bus_position = BusPosition.new
  end

  # GET /bus_positions/1/edit
  def edit
  end

  # POST /bus_positions
  # POST /bus_positions.json
  def create
    @bus_position = BusPosition.new(bus_position_params)

    respond_to do |format|
      if @bus_position.save
        format.html { redirect_to @bus_position, notice: 'Bus position was successfully created.' }
        format.json { render :show, status: :created, location: @bus_position }
      else
        format.html { render :new }
        format.json { render json: @bus_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_positions/1
  # PATCH/PUT /bus_positions/1.json
  def update
    respond_to do |format|
      if @bus_position.update(bus_position_params)
        format.html { redirect_to @bus_position, notice: 'Bus position was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_position }
      else
        format.html { render :edit }
        format.json { render json: @bus_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_positions/1
  # DELETE /bus_positions/1.json
  def destroy
    @bus_position.destroy
    respond_to do |format|
      format.html { redirect_to bus_positions_url, notice: 'Bus position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_position
      @bus_position = BusPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_position_params
      params.require(:bus_position).permit(:bus_id, :time, :latitude, :longitude, :speed)
    end
end
