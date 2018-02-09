class AssessmentsController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]

  def edit
    @assessment = Assessment.find(params[:id])
    @player = Player.find(@assessment.player_id)
  end

  def update
    @assessment = Assessment.find(params[:id])
    if @assessment.update_attributes(ass_params)
      flash[:success] = "Updated."
      redirect_to '/admin/assessments'
    else
      render 'edit'
    end
  end

  def destroy
    Assessment.find(params[:id]).destroy
    flash[:success] = "Assessment stats deleted"
    redirect_to '/admin/assessments'
  end

  def ass_params
    params.require(:assessment).permit(:time, :field, :throw, :hit, :speed, :player_id)
  end
end
