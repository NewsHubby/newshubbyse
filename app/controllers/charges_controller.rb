class ChargesController < ApplicationController

  def new
    @press_room = current_press_room
  end

  def create

    @press_room = current_press_room

    if @press_room.stripe_customer.blank?

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      subscription = customer.subscriptions.create(:plan => params[:subscription_type])

      @press_room.stripe_customer = customer.id
      @press_room.stripe_subscription = subscription.id
      @press_room.subscription_type = params[:subscription_type]
      @press_room.save()

      flash[:notice] = "Prenumerationen är nu påbörjad!"
      #redirect_to edit_press_room_registration_path

      render json: { success: true, message: "Prenumerationen är nu påbörjad!" }

    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      #redirect_to new_charge_path
      render json: { success: false, message: e.message }
  end


  def cancel_subscription
    @press_room = current_press_room
    @stripe_customer =  Stripe::Customer.retrieve(current_press_room.stripe_customer)
    if @stripe_customer.subscriptions != nil
      @stripe_subscription = @stripe_customer.subscriptions.retrieve(current_press_room.stripe_subscription)
      @stripe_subscription.delete(:at_period_end => true)
    end

    flash[:notice] = "Prenumerationen avslutad."
    redirect_to edit_press_room_registration_path

  #rescue Stripe::SubscriptionError => e
  #    flash[:error] = e.message
  #    redirect_to new_charge_path
  end

  def resume_subscription
    @press_room = current_press_room
    @stripe_customer =  Stripe::Customer.retrieve(@press_room.stripe_customer)
    @stripe_subscription = @stripe_customer.subscriptions.retrieve(@press_room.stripe_subscription)
    @stripe_subscription.plan = @press_room.subscription_type
    @stripe_subscription.save()

    flash[:notice] = "Prenumerationen återupptagen."
    redirect_to edit_press_room_registration_path
  end

  def upgrade_subscription
    @press_room = current_press_room
    @stripe_customer =  Stripe::Customer.retrieve(@press_room.stripe_customer)
    @stripe_subscription = @stripe_customer.subscriptions.retrieve(@press_room.stripe_subscription)

    @press_room.subscription_type = "premium"
    @press_room.save()

    @stripe_subscription.plan = "premium"
    @stripe_subscription.save()

    flash[:notice] = "Prenumerationen bytt till Premium. Debitering sker vid betalningsperiodens slut."
    redirect_to edit_press_room_registration_path
  end

  def downgrade_subscription
    @press_room = current_press_room
    @stripe_customer =  Stripe::Customer.retrieve(@press_room.stripe_customer)
    @stripe_subscription = @stripe_customer.subscriptions.retrieve(@press_room.stripe_subscription)

    @press_room.subscription_type = "standard"
    @press_room.save()

    @stripe_subscription.plan = "standard"
    @stripe_subscription.save()

    flash[:notice] = "Prenumerationen bytt till Standard."
    redirect_to edit_press_room_registration_path
  end

end
