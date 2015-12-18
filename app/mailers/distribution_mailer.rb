class DistributionMailer < ActionMailer::Base
  default from: "from@example.com"

  def distribution_mail(distribution)
    @distribution = distribution
    #@newsroom = @press_release.newsroom
    mail(from: @distribution.press_release.press_room.email, to: "alexandra@newshubby.com", subject: "Distribution: #{@distribution.press_release.title}")
  end

  def distribution_client_confirmation(distribution)
    @distribution = distribution
    #@newsroom = @press_release.newsroom
    mail(from: "hello@newshubby.com", to: @distribution.press_release.press_room.email, subject: "NewsHubby, distribution av pressmeddelande")
  end

  def press_room_client_trial_confirmation(press_room)
    @press_room = press_room
    mail(from: "hello@newshubby.com", to: @press_room.email, subject: "Välkommen till NewsHubby!")
  end

  def press_room_client_standard_confirmation(press_room)
    @press_room = press_room
    mail(from: "hello@newshubby.com", to: @press_room.email, subject: "Välkommen till NewsHubby!")
  end

  def press_room_client_premium_confirmation(press_room)
    @press_room = press_room
    mail(from: "hello@newshubby.com", to: @press_room.email, subject: "Välkommen till NewsHubby!")
  end

end
