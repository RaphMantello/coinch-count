class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
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
end
