class Api::AchievementsController < ApiController
  
  #p request.headers["Content-Type"]

  def index
  	achievements = Achievement.public_access
    render json: achievements
  end
end