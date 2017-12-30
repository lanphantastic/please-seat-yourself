class SessionsController < ApplicationController
end

def new

end

def create

  if params[:email].present?
    if valid_email?(params[:email])
      if params[:password].present?
        user = User.find_by(email: params[:email])

        # check if both email or password are correct
        if user && user.authenticate( params[:password] )
          session[:user_id] = user.id
          redirect_to restaurants_url
        else
          flash[:notice] = "Wrong email/password combination"
          render :new
          flash.clear
        end

      # check password
      end
    # only one unique email
    end
    # email cannot be blank
  end
end

def destroy

end
