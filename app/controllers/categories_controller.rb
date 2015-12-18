class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :press_room

  respond_to :html

  def index

    @press_room = current_press_room
    @stripe_customer = nil
    @stripe_subscription = nil
    if current_press_room.stripe_customer != nil and current_press_room.stripe_customer.length > 0
      @stripe_customer =  Stripe::Customer.retrieve(current_press_room.stripe_customer)
      if @stripe_customer != nil and current_press_room.stripe_subscription != nil
        @stripe_subscription = @stripe_customer.subscriptions.retrieve(current_press_room.stripe_subscription)
      end
    end

    if @press_room.subscription_type == "premium" or @press_room.subscription_type == "standard"
      if @stripe_subscription == nil or @stripe_subscription.status != "active"
        flash[:notice] = "Ingen betalning gjord. Betalning tack!"
        redirect_to edit_press_room_registration_path
      else
        @categories = Category.all
        respond_with(@categories)
      end
    elsif @press_room.subscription_type == "trial_standard"
      if @press_room.trial_end_at < DateTime.now
        flash[:notice] = "Testperiod slut!"
        redirect_to edit_press_room_registration_path
      else
        @categories = Category.all
        respond_with(@categories)
      end
    else
      @categories = Category.all
      respond_with(@categories)
    end
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
      #@press_release_type = PressReleaseType.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
