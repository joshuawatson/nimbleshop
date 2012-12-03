if Rails.env.test?

elsif Nimbleshop.config.deliver_email

  # Setup how you want email to be delivered

else

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    user_name:      Nimbleshop.config.mailtrap.username,
    password:       Nimbleshop.config.mailtrap.password,
    address:        Nimbleshop.config.mailtrap.address,
    port:           Nimbleshop.config.mailtrap.port,
    authentication: :plain }

end
