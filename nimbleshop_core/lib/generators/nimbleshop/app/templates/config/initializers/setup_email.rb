if Rails.env.test?

    # no configuration needed for test environment

elsif Nimbleshop.config.deliver_email

  # Setup how you want email to be delivered

else

  # In environments like development and staging emails should go to  mailtrap.io
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    user_name:      Nimbleshop.config.mailtrap.username,
    password:       Nimbleshop.config.mailtrap.password,
    address:        Nimbleshop.config.mailtrap.address,
    port:           Nimbleshop.config.mailtrap.port,
    authentication: :plain }

end
