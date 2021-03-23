class SignupsController < ApplicationController
  def new
    @signup = Signup.new
    @campers = Camper.all
    @activities = Activity.all
  end

  def create
    @signup = Signup.create(params.require(:signup).permit(:camper_id, :activity_id, :hour))
    
    if @signup.valid?
      redirect_to camper_path(@signup.camper_id)
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to new_signup_path
    end
  end

  def camper_signup
      @signup = Signup.new
      @activities = Activity.all
      @camper = Camper.find(params[:id])
  end

  def create_camper_signup
    @signup = Signup.create(params.require(:signup).permit(:camper_id, :activity_id, :hour))
    
    if @signup.valid?
      redirect_to camper_path(@signup.camper_id)
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to camper_signup_path(params[:id])
    end
  end
  
  def activity_signup
    @signup = Signup.new
    @activity = Activity.find(params[:id])
    @campers = Camper.all
  end

  def create_activity_signup
    @signup = Signup.create(params.require(:signup).permit(:camper_id, :activity_id, :hour))
  
    if @signup.valid?
      redirect_to camper_path(@signup.camper_id)
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to activity_signup_path(params[:id])
    end
  end
    
end
