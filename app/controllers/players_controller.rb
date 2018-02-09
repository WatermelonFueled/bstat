class PlayersController < ApplicationController

before_action :authorize, only: [:edit, :update, :destroy]

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = "Updated."
      redirect_to '/admin/playerslist'
    else
      render 'edit'
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player deleted"
    redirect_to '/admin/playerslist'
  end

  def player_params
    params.require(:player).permit(:id, :firstname, :lastname, :number, :nickname, :secretkey)
  end
end

