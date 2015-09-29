class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(press_room)
    edit_press_room_path(current_press_room) # Or :prefix_to_your_route
  end
end