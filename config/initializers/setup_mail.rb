ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "alan.opinionbox@gmail.com",
  :password             => "minhavidas1",
  :authentication       => "plain",
  :enable_starttls_auto => true
}