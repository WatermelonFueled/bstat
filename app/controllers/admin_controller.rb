class AdminController < ApplicationController
  before_filter :authorize




def gameslist
   @Games = Game.select('Games.gamecode,
                sum(Games.atbat) as atbat,
                sum(Games.run) as run,
                sum(Games.rbi) as rbi,
                sum(Games.stolenbase) as stolenbase,
                sum(Games.single) as single,
                sum(Games.double) as double,
                sum(Games.triple) as triple,
                sum(Games.homerun) as homerun,
                sum(Games.strikeout) as strikeout,
                sum(Games.error) as error,
                sum(Games.sacfly) as sacfly,
                sum(Games.lineout) as lineout,
                sum(Games.groundout) as groundout,
                sum(Games.flyout) as flyout,
                sum(Games.fc) as fc,
                (sum(Games.flyout) + sum(Games.strikeout) + sum(Games.sacfly)) as fss,
                (sum(Games.lineout) + sum(Games.groundout) + sum(Games.fc)) as lgf ,
                (sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) as hit,
                (sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) as totalbases,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/sum(Games.atbat),3) as avg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) as obp,
                ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3) as slg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) 
                + ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3)as ops').
              where("atbat>0").
              group('gamecode')
end

def gamesviewer
    @gamecode = params[:gamecode]
@Games = Game.joins('LEFT OUTER JOIN Players ON Games.player_id = Players.id').
              select('Players.firstname, Players.lastname, Players.secretkey, 
                sum(Games.atbat) as atbat,
                sum(Games.run) as run,
                sum(Games.rbi) as rbi,
                sum(Games.stolenbase) as stolenbase,
                sum(Games.single) as single,
                sum(Games.double) as double,
                sum(Games.triple) as triple,
                sum(Games.homerun) as homerun,
                sum(Games.strikeout) as strikeout,
                sum(Games.error) as error,
                sum(Games.sacfly) as sacfly,
                sum(Games.lineout) as lineout,
                sum(Games.groundout) as groundout,
                sum(Games.flyout) as flyout,
                sum(Games.fc) as fc,
                (sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) as hit,
                (sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) as totalbases,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/sum(Games.atbat),3) as avg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) as obp,
                ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3) as slg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) 
                + ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3)as ops').
              where(" atbat>0 AND gamecode = '#{params[:gamecode]}'").
              group('player_id, Players.firstname, Players.secretkey, Players.lastname')



              @Totals = Game.
              select('
                sum(Games.atbat) as atbat,
                sum(Games.run) as run,
                sum(Games.rbi) as rbi,
                sum(Games.stolenbase) as stolenbase,
                sum(Games.single) as single,
                sum(Games.double) as double,
                sum(Games.triple) as triple,
                sum(Games.homerun) as homerun,
                sum(Games.strikeout) as strikeout,
                sum(Games.error) as error,
                sum(Games.sacfly) as sacfly,
                sum(Games.lineout) as lineout,
                sum(Games.groundout) as groundout,
                sum(Games.flyout) as flyout,
                sum(Games.fc) as fc,
                (sum(Games.flyout) + sum(Games.strikeout) + sum(Games.sacfly)) as fss,
                (sum(Games.lineout) + sum(Games.groundout) + sum(Games.fc)) as lgf ,
                (sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) as hit,
                (sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) as totalbases,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/sum(Games.atbat),3) as avg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) as obp,
                ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3) as slg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) 
                + ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3)as ops').
              where("gamecode = '#{params[:gamecode]}'")
end


  def playerviewer
    @Games = Game.joins('LEFT OUTER JOIN Players ON Games.player_id = Players.id').
              select('Players.firstname, Players.lastname, Players.secretkey, 
                sum(Games.atbat) as atbat,
                sum(Games.run) as run,
                sum(Games.rbi) as rbi,
                sum(Games.stolenbase) as stolenbase,
                sum(Games.single) as single,
                sum(Games.double) as double,
                sum(Games.triple) as triple,
                sum(Games.homerun) as homerun,
                sum(Games.strikeout) as strikeout,
                sum(Games.error) as error,
                sum(Games.sacfly) as sacfly,
                sum(Games.lineout) as lineout,
                sum(Games.groundout) as groundout,
                sum(Games.flyout) as flyout,
                sum(Games.fc) as fc,
                (sum(Games.flyout) + sum(Games.strikeout) + sum(Games.sacfly)) as fss,
                (sum(Games.lineout) + sum(Games.groundout) + sum(Games.fc)) as lgf ,
                (sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) as hit,
                (sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) as totalbases,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/sum(Games.atbat),3) as avg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) as obp,
                ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3) as slg,
                ROUND(CAST((sum(Games.single)+sum(Games.double)+sum(Games.triple)+sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)+sum(Games.sacfly)),3) 
                + ROUND(CAST((sum(Games.single)+2*sum(Games.double)+3*sum(Games.triple)+4*sum(Games.homerun)) AS DECIMAL)/(sum(Games.atbat)),3)as ops').
              where("isofficial = 'y' AND atbat>0").
              group('player_id, Players.firstname, Players.secretkey, Players.lastname').
              order("firstname ASC")

  end

  def addgamestats
    @Games = Array.new
    @Players = Player.all
    Player.order("firstname ASC").each do |i|
      @Games<<Game.new(player_id: i.id)
    end
  end

  def savegamestats
    params["games"].each do |game|
      if game["atbat"] == "0"
      else
      freshgame = Game.new(game_params(game))
      freshgame.gamecode = params["gamecode"][0]

        if params["isofficial"]
          freshgame.isofficial = true
        else
          freshgame.isofficial = false
        end
        freshgame.save
      end
    end
    
    redirect_to '/admin/masterviewer'
    flash[:success] = "Added stats"
  end

  def masterviewer
    @Games = Game.joins('LEFT OUTER JOIN Players ON Games.player_id = Players.id ORDER BY gamecode')
  end

  def assessments
    @Assessments = Assessment.joins('LEFT OUTER JOIN Players ON Assessments.player_id = Players.id ORDER BY time')
  end

  def game_params(my_params)
    my_params.permit(:strikeout, :run, :rbi, :stolenbase, :atbat, :single, :double, :triple, :homerun, :flyout, :lineout, :groundout, :fc, :player_id, :error, :sacfly)
  end

def playerslist
   @Players = Player.select('id, firstname, lastname, nickname, secretkey, number').
              order('firstname ASC')
end

def addplayer
  @Player = Array.new
  @Player <<Player.new
end

def saveplayer
  params["players"].each do |play|
    freshplayer = Player.new(player_params(play))
    freshplayer.save

  end
    flash[:success] = "Player Added"
  redirect_to '/admin/playerslist'
  

end

def player_params(my_params)
  my_params.permit(:firstname, :lastname, :nickname, :number, :secretkey)
  end

def addassessments
    @Assessments = Array.new
    @Players = Player.all
    Player.order("firstname ASC").each do |i|
      @Assessments<<Assessment.new(player_id: i.id)
    end
  end

  def saveassessments
    redirect_to '/admin/assessments'
    params["assessments"].each do |ass|
      freshgame = Assessment.new(ass_params(ass))
      freshgame.time = params["time"][0]
      
      freshgame.save
    end
    flash[:success] = "Added stats"
    
  end

  def ass_params(my_params)
    my_params.permit(:field, :throw, :hit, :speed, :player_id)
  end
end
