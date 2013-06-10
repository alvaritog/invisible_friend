class PlayerMailer < ActionMailer::Base

  default from: "amigoinvisible.incombustible@gmail.com"
#  default from: Rails.application.config.action_mailer[:smtp_settings][:user_name]

  def test_email(address)
    mail(:to => address, :subject => "Mail de prueba")
  end

  def raffle_results_email(player)
    @player = player
    mail(:to => [player.email], :subject => "Amigo invisible, #{player.player_list.name}")
  end

end
