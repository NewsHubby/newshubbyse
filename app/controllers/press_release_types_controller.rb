class PressReleaseTypesController < ApplicationController
  before_action :set_press_release_type, only: [:show, :edit, :update, :destroy]


  load_and_authorize_resource :press_room
  #load_and_authorize_resource :press_release_type, :through => :press_room

  # GET /press_release_types
  # GET /press_release_types.json
  def index
    @category = Category.find(params[:id])
    @press_release_types = @category.press_release_types.all
  end

  # GET /press_release_types/1
  # GET /press_release_types/1.json
  def show
  end

  # GET /press_release_types/new
  def new
    @category = Category.find(params[:category_id])
    @press_release_type = @category.press_release_types.new(category_id: params[:category_id])
  end

  # GET /press_release_types/1/edit
  def edit
  end

  # POST /press_release_types
  # POST /press_release_types.json
  def create
    @press_release_type = PressReleaseType.new(press_release_type_params)
    @category = Category.find(params[:category_id])
    
    respond_to do |format|
      if @press_release_type.save
        format.html { redirect_to category_press_release_type_path(@category, @press_release_type), notice: 'Press release type was successfully created.' }
        format.json { render :show, status: :created, location: @press_release_type }
      else
        format.html { render :new }
        format.json { render json: @press_release_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_release_types/1
  # PATCH/PUT /press_release_types/1.json
  def update
    respond_to do |format|
      if @press_release_type.update(press_release_type_params)
        format.html { redirect_to category_press_release_type_path(@category, @press_release_type), notice: 'Press release type was successfully updated.' }
        format.json { render :show, status: :ok, location: @press_release_type }
      else
        format.html { render :edit }
        format.json { render json: @press_release_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_release_types/1
  # DELETE /press_release_types/1.json
  def destroy
    @press_release_type.destroy
    respond_to do |format|
      format.html { redirect_to press_release_types_url, notice: 'Press release type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_release_type
      @category = Category.find(params[:category_id])
      @press_release_type = PressReleaseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_release_type_params
      params.require(:press_release_type).permit!#(:name)
    end
end
