class PressReleasesController < ApplicationController
  before_action :set_press_release, only: [:show, :edit, :update, :destroy]
    
  load_and_authorize_resource :press_room
  load_and_authorize_resource :press_release, :through => :press_room  
  
  # GET /press_releases
  # GET /press_releases.json
  def index
    @press_room = PressRoom.friendly.find(params[:press_room_id])
    
    if params[:search]
      @press_releases = PressRelease.where(exclusive: false).where("embargo <= ?", Date.today).search(params[:search])
    else 
      @press_releases = @press_room.press_releases.all
    end
    
    
    if can? :update, @press_room
      @press_releases = @press_room.press_releases.paginate(:page => params[:page], :per_page => 10)
    else
      @press_releases = @press_room.press_releases.where(exclusive: false).where("embargo <= ?", Date.today).search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
    
  end

  # GET /press_releases/1
  # GET /press_releases/1.json
  def show
    
    if cannot? :manage, @press_release
      if @blocked
        flash[:notice] = "Pressmeddelandet finns inte!"
        redirect_to :root
      end
    end
    
  end

  # GET /press_releases/new
  def new
    @press_room = current_press_room
    @press_release = @press_room.press_releases.new(press_release_type_id: params[:press_release_type_id])
    
    @press_release.hex = SecureRandom.urlsafe_base64(6)
    
    @press_release.uploads.build
    @press_release.links.build
    
    @press_release.save
    redirect_to edit_press_room_press_release_path(@press_room, @press_release)
  end

  # GET /press_releases/1/edit
  def edit
    @presto = true
    
    @field_count = @press_release.press_release_type.fields.where.not(field_type: "line_break").count
  end

  # POST /press_releases
  # POST /press_releases.json
  def create
    @press_release = PressRelease.new(press_release_params)

    respond_to do |format|
      if @press_release.save
        format.html { redirect_to press_room_press_release_path(@press_release.press_room, @press_release), notice: 'Press release was successfully created.' }
        format.json { render :show, status: :created, location: @press_release }
      else
        format.html { render :new }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_releases/1
  # PATCH/PUT /press_releases/1.json
  def update
    respond_to do |format|
      if @press_release.update(press_release_params)
        format.html { redirect_to press_room_press_release_path(@press_release.press_room.id, @press_release), notice: 'Press release was successfully updated.' }
        format.json { respond_with_bip(@press_release) }
        format.js { render "press_releases/update", notice: "Saved!" }
      else
        format.html { render :edit }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_releases/1
  # DELETE /press_releases/1.json
  def destroy
    @press_release.destroy
    respond_to do |format|
      format.html { redirect_to press_releases_url, notice: 'Press release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_release
      @press_room = PressRoom.friendly.find(params[:press_room_id])
      @press_release = PressRelease.friendly.find(params[:id])
      
      if @press_release.exclusive? && @press_release.hex != params[:hex]
        @blocked = true
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_release_params
      params.require(:press_release).permit!#(:title, :slug, :hex, :exclusive, :embargo, :press_room_id, :press_release_type_id, :properties)
    end
end
