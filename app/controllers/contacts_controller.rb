class ContactsController < ApplicationController
  def index
    case params[:provider]
    when 'google_oauth2' then redirect_to '/contacts/gmail'
    when 'facebook'
      koala = Koala::Facebook::API.new(request.env['omniauth.auth']['credentials']['token'])
      raise koala.get_connections('me', 'invitable_friends').inspect
    when 'linkedin' then redirect_to '/contacts/linkedin'
    end
  end

  def new
    case params[:provider]
    when 'gmail'
      @contacts = request.env['omnicontacts.contacts'].map{ |p| p[:email] }.compact
    when 'facebook'
      puts request.env['omnicontacts.contacts'].inspect
      @contacts = request.env['omnicontacts.contacts']
    when 'linkedin'
      @contacts = request.env['omnicontacts.contacts']
      puts @contacts.inspect
    end

    @contacts = 'Have no contacts' if @contacts.try(:empty?)

    render 'pages/root'
  end
end
