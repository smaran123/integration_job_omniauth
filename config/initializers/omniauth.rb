Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_app_id'], ENV['google_app_secret'], {
    scope: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/userinfo#email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.google.com/m8/feeds'
    ],
    access_type: 'offline'
  }
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret'], scope: 'email,user_friends,offline_access',
    client_options: {
      site: 'https://graph.facebook.com/v2.0',
      authorize_url: 'https://www.facebook.com/v2.0/dialog/oauth'
    }
  provider :linkedin, ENV['linkedin_app_id'], ENV['linkedin_app_secret'], scope: 'r_basicprofile'
end
