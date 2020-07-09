class BiddingsController < ApplicationController
  before_action :set_game, only: [:new, :create, :edit, :update]
  before_action :set_bidding, only: [:edit, :update]

  def new
    @bidding = Bidding.new
    bid_options
  end

  def create
    @bidding = Bidding.new(bidding_params)
    @bidding.game = @game

    if @bidding.save
      bid_success
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    bid_options
  end

  def update
    @bidding.update(bidding_params)
    bid_success

    redirect_to game_path(@game)
  end

  private

  def bidding_params
    params.require(:bidding).permit(:bid_points, :bid_color, :bid_team, :belote, :countered, :points)
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_bidding
    @bidding = @game.biddings.find(params[:id])
  end

  def bid_success
    @bidding.success = false if @bidding.bid_points > @bidding.points
    @bidding.save
  end

  def bid_options
    @bid_points_options = [80, 90, 100, 110, 120, 130, 140, 150, 160, 250, 500]
    @bid_color_options = ['Coeur', 'Pique', 'Carreau', 'Trèfle']
    @bid_team_options = [1, 2]
    @countered_options = ['Non', 'Contrée', 'Surcontrée']
    @belote_options = ['Oui', 'Non']
  end
end
