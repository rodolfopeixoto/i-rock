class EncouragementsController < ApplicationController

  before_action :autheticate_user

  def new
  end

 private
 def autheticate_user
   @achievement = Achievement.find(params[:achievement_id])
   unless current_user
     redirect_to achievement_path(@achievement), alert: 'You must be logged in to encourage people'
     return
   end
 end
end