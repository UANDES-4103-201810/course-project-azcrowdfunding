class CallbacksController < ApplicationController
  def facebook
    redirect_to new_facebook_path(request.env['omniauth.auth'])
  end
end
