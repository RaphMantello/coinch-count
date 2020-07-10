class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    game_scores
    game_winner
    biddings_size
  end

  def new
    @game = Game.new
    @game.biddings.build
  end

  def create
    @game = Game.new(game_params)
    @game.save

    redirect_to game_path(@game)
  end

  def edit
  end

  def update
    @game.update(game_params)

    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy

    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :score_1, :score_2, :created_at)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_scores
    @game.score_1 = 0
    @game.score_2 = 0

    @game.biddings.each do |b|
      if b.bid_points <= b.points
        capot?(b)
      else
        bid_score_failed(b, 160, 1)
      end
    end

    @game.save
  end

  def capot?(bidding)
    if bidding.points == 250
      capot_unannounced(bidding)
    else
      capot_and_not_capot(bidding)
    end
  end

  def capot_unannounced(bidding)
    countered?(bidding, bidding.points)
  end

  def capot_and_not_capot(bidding)
    countered?(bidding, bidding.bid_points)
  end

  def countered?(bidding, points)
    if bidding.countered == 'Contrée'
      bid_score(bidding, points, 2)
    elsif bidding.countered == 'Surcontrée'
      bid_score(bidding, points, 4)
    else
      bid_score(bidding, points, 1)
    end
  end

  def bid_score(bidding, points, countered)
    if bidding.bid_team == 1
      @game.score_1 = @game.score_1 + (points * countered)
    else
      @game.score_2 = @game.score_2 + (points * countered)
    end
  end

  def bid_score_failed(bidding, points, countered)
    if bidding.bid_team == 1
      @game.score_2 = @game.score_2 + (points * countered)
    else
      @game.score_1 = @game.score_1 + (points * countered)
    end
  end

  def game_winner
    @winner = ""
    if @game.score_1 >= 1000 || @game.score_2 >= 1000
      if @game.score_1 < @game.score_2
        @winner = 2
      else
        @winner = 1
      end
    end
  end

  def biddings_size
    @biddings_size = @game.biddings.size
  end
end
