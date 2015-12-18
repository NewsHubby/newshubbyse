class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    # If trial isn't set, set to current time and 30 days forward.
    if current_press_room.trial_end_at.nil?
      set_trial_dates()
    end
    @time_left = ((Time.now - current_press_room.trial_end_at).seconds / 86400)
    @stripe_customer = nil
    @stripe_subscription = nil
    if !current_press_room.stripe_customer.blank?
      @stripe_customer =  Stripe::Customer.retrieve(current_press_room.stripe_customer)
      if !@stripe_customer.subscriptions.blank?
        @stripe_subscription = @stripe_customer.subscriptions.retrieve(current_press_room.stripe_subscription)
      end
    end
  end

  def destroy
    if !current_press_room.stripe_customer.blank?
      @stripe_customer =  Stripe::Customer.retrieve(current_press_room.stripe_customer)
      if @stripe_customer != nil
        @stripe_customer.delete()
      end
    end
    super
  end

  protected

  def set_trial_dates()
    t = Time.new
    current_press_room.trial_start_at = t
    current_press_room.trial_end_at = t + 30.days
    current_press_room.save()
  end

  def after_sign_up_path_for(press_room)
    set_trial_dates()
    if (press_room.subscription_type == "trial_standard")
      DistributionMailer.press_room_client_trial_confirmation(press_room).deliver
    elsif (press_room.subscription_type == "standard")
      DistributionMailer.press_room_client_standard_confirmation(press_room).deliver
    elsif (press_room.subscription_type == "premium")
      DistributionMailer.press_room_client_premium_confirmation(press_room).deliver
    end
    edit_press_room_path(current_press_room) # Or :prefix_to_your_route
  end
end
