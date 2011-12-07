ActionMailer::Base.smtp_settings = {
   :address => 'smtp.gmail.com', 
   :port => 587,
   :domain => 'Kenobi',
   :authentication => :plain,
   :user_name => 'mailer.rubypadawan@gmail.com', 
   :password => 'rubypadawan'
}
