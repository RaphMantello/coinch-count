class BiddingsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @bidding = Bidding.new
    bid_options
  end

  def create
    @bidding = Bidding.new(bidding_params)
    @game = Game.find(params[:game_id])
    @bidding.game = @game

    if @bidding.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def bidding_params
    params.require(:bidding).permit(:bid_points, :bid_color, :bid_team, :belote, :countered, :points)
  end

  def bid_options
    @bid_points_options = [80, 90, 100, 110, 120, 130, 140, 150, 160, 260, 500]
    @bid_color_options = ['Coeur', 'Pique', 'Carreau', 'Trèfle']
    @bid_team_options = [1, 2]
    @countered_options = ['Oui', 'Non']
    @belote_options = ['Oui', 'Non']
  end
end
