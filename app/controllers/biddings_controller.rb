class BiddingsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @bidding = Bidding.new
  end

  def create
    @bidding = Bidding.new(bidding_params)
    @game = Game.find(params[:game_id])
    @bidding.game = @game
    @bidding.save

    redirect_to game_path(@game)
  end

  private

  def bidding_params
    params.require(:bidding).permit(:bid_points, :bid_color, :bid_team, :countered, :points)
  end
end
