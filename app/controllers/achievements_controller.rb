class AchievementsController < ApplicationController

 before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 before_action :owners_only, only: [:show, :edit, :update, :destroy]

 def index
  @achievements = Achievement.get_public_achievements # all not working test

 end
 
 def new
      @achievement = Achievement.new
  end
  
  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user = current_user
    if @achievement.save
      UserMailer.achievement_created(current_user.email, @achievement.id).deliver_now
      tweet = TwitterService.new.tweet(@achievement.title)
      redirect_to achievement_path(@achievement), notice: "Achievement has been created. We tweeted for you! #{tweet.url}"
    else
      #render nothing: true 
      render :new
    end
  end

  def edit
  end

  def update
    if @achievement.update_attributes(achievement_params)
      redirect_to achievement_path(@achievement)
    else
      render :edit
    end

    # @achievement = Achievement.find(params[:id])
    # render nothing: true
  end
  
  def show
     @achievement = Achievement.find(params[:id])
  end
  
  def destroy
    @achievement.destroy
    redirect_to achievements_path
  end

  private
  
  def achievement_params
    params.require(:achievement).permit(:title, :description, :privacy, :cover_image, :featured )
  end

  def owners_only
    @achievement = Achievement.find(params[:id])
    if current_user != @achievement.user
      redirect_to achievements_path
    end
  end
end