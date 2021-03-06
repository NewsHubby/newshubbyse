class PressRoomsController < ApplicationController
  before_action :set_press_room, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :press_room

  autocomplete :press_release, :title, :scopes => [:non_exclusive]

  def about

  end

  def terms_and_conditions

  end

  # GET /press_rooms
  # GET /press_rooms.json
  def index

    @press_releases = PressRelease.where(exclusive: false).where("embargo <= ?", Date.today).search(params[:search]).paginate(:page => params[:page], :per_page => 4)

    @press_rooms = PressRoom.all
  end

  # GET /press_rooms/1
  # GET /press_rooms/1.json
  def show

    if can? :update, @press_room
      @press_releases = @press_room.press_releases.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    else
      @press_releases = @press_room.press_releases.where(exclusive: false).where("embargo <= ?", Date.today).search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    end

  end

  # GET /press_rooms/new
  def new
    @press_room = PressRoom.new
  end

  # GET /press_rooms/1/edit
  def edit
  end

  # POST /press_rooms
  # POST /press_rooms.json
  def create
    @press_room = PressRoom.new(press_room_params)

    @press_room.trial_start_at = Time.now

    respond_to do |format|
      if @press_room.save
        format.html { redirect_to @press_room, notice: 'Press room was successfully created.' }
        format.json { render :show, status: :created, location: @press_room }
      else
        format.html { render :new }
        format.json { render json: @press_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_rooms/1
  # PATCH/PUT /press_rooms/1.json
  def update
    respond_to do |format|
      if @press_room.update(press_room_params)
        format.html {
          if @press_room.subscription_type == "standard"
            flash[:notice] = "Betala for Standard!"
            redirect_to edit_press_room_registration_path
          elsif @press_room.subscription_type == "premium"
            flash[:notice] = "Betala for Premium!"
            redirect_to edit_press_room_registration_path
          else
            redirect_to @press_room, notice: 'Pressrummet sparades.'
          end
        }
        format.json { render :show, status: :ok, location: @press_room }
      else
        format.html { render :edit }
        format.json { render json: @press_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_rooms/1
  # DELETE /press_rooms/1.json
  def destroy
    @press_room.destroy
    respond_to do |format|
      format.html { redirect_to press_rooms_url, notice: 'Press room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_room
      @press_room = PressRoom.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_room_params
      params.require(:press_room).permit(:id, :subscription_type, :company_name, :twitter, :phone, :founded, :website, :press_email, :location, :logo, :longitude, :latitude, :term_agreement, :competition, :problem_solved, :business_model, people_attributes: [:id, :name, :position, :presentation, :founder, :_destroy], fundings_attributes: [:id, :name, :sum, :investment_type, :date, :_destroy])
    end
end
