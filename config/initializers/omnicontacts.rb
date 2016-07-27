Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV['google_app_id'], ENV['google_app_secret']
  importer :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret'], auth_host: 'https://graph.facebook.com/v2.0'
  importer :linkedin, ENV['linkedin_app_id'], ENV['linkedin_app_secret'], { state: ENV['linkedin_state'] }
end
