class SessionsController < ApplicationController
  def new
  end

  def create
	      man = Man.authenticate(params[:name],params[:password])
          if man
		  session[:man_id] = man.id
		  if Man.checkIsDoctor(params[:name]) == false
		  redirect_to user_url
		  else
            # man = Man.getManbyId(params[:man_id])
            # doctor_id = Man.getDoctor_id(params[:man_id])
		    #doctor = Doctor.getDoctorbyName(doctor_id)
		    # redirect_to doctors_url(:domain => "edit/com", :doctor => doctor) 
              redirect_to user_url
		  end
	  else
		  redirect_to login_url,:alert => "Invalid man/password combination"
	  end
  end

  def destroy
	  session[:man_id] = nil
	  redirect_to users_url, :notict => "Logged out"
  end

end
