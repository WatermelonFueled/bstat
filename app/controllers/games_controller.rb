class GamesController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]

  def edit
    @game = Game.find(params[:id])
    @player = Player.find(@game.player_id)
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      flash[:success] = "Updated."
      redirect_to '/admin/masterviewer'
    else
      render 'edit'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = "Game stats deleted"
    redirect_to '/admin/masterviewer'
  end

  def game_params
    params.require(:game).permit(:strikeout, :run, :rbi, :stolenbase, :atbat, :single, :double, :triple, :homerun, :flyout, :lineout, :groundout, :fc, :player_id, :error, :sacfly)
  end
end
