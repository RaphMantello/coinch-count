class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    game_scores
    game_winner
  end

  def new
    @game = Game.new
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
    params.permit(:name, :score_1, :score_2, :created_at)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_scores
    @game.score_1 = 0
    @game.score_2 = 0

    @game.biddings.where(bid_team: 1).each do |b|
      if b.bid_points < b.points
        @game.score_1 = @game.score_1 + b.bid_points
      else
        @game.score_2 = @game.score_2 + 160
      end
    end
    @game.biddings.where(bid_team: 2).each do |b|
      if b.bid_points < b.points
        @game.score_2 = @game.score_2 + b.points
      else
        @game.score_1 = @game.score_1 + 160
      end
    end
    @game.save
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
end
