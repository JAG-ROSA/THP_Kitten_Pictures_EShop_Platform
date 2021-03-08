# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :api_key => ENV['MAILJET_API_KEY'],
  :secret_key => ENV['MAILJET_SECRET_KEY'],
  :domain => 'kittenproject.com',
  :address => 'in-v3.mailjet.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}