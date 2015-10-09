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
  
end
