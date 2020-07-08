class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    game_count
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

  def game_count
    @game.score_1 = 0
    @game.score_2 = 0
    @game.biddings.where('bid_team = 1').each do |b|
      @game.score_1 = @game.score_1 + b.points
    end
    @game.biddings.where('bid_team = 2').each do |b|
      @game.score_2 = @game.score_2 + b.points
    end
  end
end
