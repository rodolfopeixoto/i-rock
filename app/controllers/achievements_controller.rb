class AchievementsController < ApplicationController

 before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

 def index
  @achievements = Achievement.public_access # all not working test

 end
 
 def new
      @achievement = Achievement.new
  end
  
  def create
    @achievement = Achievement.new(achievement_params)
    
    if @achievement.save
      redirect_to achievement_url(@achievement), notice: 'Achievement has been created.'
    else
      render :new
    end
  end

  def edit
    @achievement = Achievement.find(params[:id])
  end

  def update

    @achievement = Achievement.find(params[:id])

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
    Achievement.destroy(params[:id])
    redirect_to achievements_path
  end

  private
  
  def achievement_params
    params.require(:achievement).permit(:title, :description, :privacy, :cover_image, :featured )
  end
end