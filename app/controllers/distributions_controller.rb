class DistributionsController < ApplicationController
  before_action :set_distribution, only: [:show, :edit, :update, :destroy]

  respond_to :html

#  load_and_authorize_resource :press_room
#  load_and_authorize_resource :distribution, :through => :press_room

  def index
    @distributions = Distribution.all
    respond_with(@distributions)
  end

  def show
    respond_with(@distribution)
  end

  def new
    @press_release = PressRelease.friendly.find(params[:press_release_id])
    @press_room = PressRoom.friendly.find(params[:press_room_id])
    @distribution = Distribution.new#(press_release_id: @press_release.id)
    #respond_with(@distribution)
  end

  def edit
  end

  def create
    @press_release = PressRelease.friendly.find(params[:press_release_id])
    @press_room = PressRoom.friendly.find(params[:press_room_id])
    
    
    @distribution = Distribution.new(distribution_params)
    @distribution.save
    #respond_with(press_room_press_release_distribution_path([@distribution.press_release, @distribution.press_release, @distribution]))
    
    DistributionMailer.distribution_mail(@distribution).deliver
    DistributionMailer.distribution_client_confirmation(@distribution).deliver
    
    flash[:notice] = "Tack för er beställning! Vi har skickat ett bekräftelsemail med mer information till den mailadress ni tidigare angett."
    redirect_to press_room_press_release_distribution_path(@press_room.id, @press_release.id, @distribution)
  end

  def update
    @distribution.update(distribution_params)
    respond_with(@distribution)
  end

  def destroy
    @distribution.destroy
    respond_with(@distribution)
  end

  private
    def set_distribution
      @distribution = Distribution.find(params[:id])
    end

    def distribution_params
      params.require(:distribution).permit(:no_publications, :preferred1, :preferred2, :preferred3, :preferred4, :preferred5, :distribution_date, :misc_information, :press_release_id)
    end
end
