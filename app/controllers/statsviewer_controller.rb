class StatsviewerController < ApplicationController
  def show
  	pid   = Player.where("secretkey = '#{params[:secretkey]}'").pluck(:id)
  	if pid.size == 1 
	  	@game = Game.where("player_id = #{pid[0]}AND isofficial = 'y'")
	  	@ngame = Game.where("player_id = #{pid[0]}AND isofficial = 'f'")
	  	@player = Player.where("id = #{pid[0]}")
	  	@assessment = Assessment.where("player_id = #{pid[0]}")


        @total_game = Game.where("player_id = #{pid[0]} AND isofficial = 'y'").count(:id)
	  	@total_atbat = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:atbat)
		@total_single = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:single)
		@total_double = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:double)
		@total_triple = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:triple)
		@total_homerun = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:homerun)
		@total_lineout = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:lineout)
		@total_groundout = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:groundout)
		@total_flyout = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:flyout)
		@total_fc = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:fc)
		@total_sacfly = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:sacfly)
		@total_error  = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:error)
		@total_run  = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:run)
		@total_rbi  = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:rbi)
     	@total_sb  = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:stolenbase)
     	@total_strikeout  = Game.where("player_id = #{pid[0]}AND isofficial = 'y'").sum(:strikeout)
     	
     	@hit = @total_single + @total_double + @total_triple + @total_homerun
     	@totalbases = @total_single + 2*@total_double + 3*@total_triple + 4*@total_homerun

     	@AVG = 0;
     	@OBP = 0;
     	@OPS = 0;
     	@SLG = 0;

     	if @total_atbat > 0 
	     	@AVG = (@hit)/@total_atbat.to_f
	     	@OBP = (@hit)/(@total_atbat.to_f+@total_sacfly.to_f)
	     	@SLG = (@totalbases)/@total_atbat.to_f
	     	@OPS = @OBP+@SLG;
	     	@AVG = @AVG.round(3);
	     	@OBP = @OBP.round(3);
	     	@OPS = @OPS.round(3);
	     	@SLG = @SLG.round(3);

    	end

	else
		redirect_to root_path
	end

  end
end
