class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
    @user = current_user
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

      def edit
          @user = current_user
          @appearance = Appearance.find(params[:id])
      end

      def update
          @appearance = Appearance.find(params[:id])
          @appearance.update(appearance_params)

          redirect_to episode_path(@appearance.episode)

      end

      def index
          @appearances = Appearance.all
      end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
