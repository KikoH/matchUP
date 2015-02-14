ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "https://pure-taiga-8764.herokuapp.com",
  :user_name            => "kiiko87@gmail.com",
  :password             => "Kiko0987",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "https://pure-taiga-8764.herokuapp.com"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?