class GamesController < ApplicationController
  respond_to :html, :json, :js
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:destroy, :update, :index, :new, :create]
  def index
    @games = Game.all
    if Profile.first
      @profile = Profile.first
    else
      @profile = Profile.create(:flash_size => 600, :flash_width=>400 )
    end
    respond_with(@games)
  end

  def start
    @games = Game.all
    respond_with(@games)
  end

  def show
    @height = Profile.first.flash_size rescue 400
    @width = Profile.first.flash_width rescue 600
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    flash[:notice] = 'Game was successfully created.' if @game.save
    respond_with(@game)
  end

  def update
    flash[:notice] = 'Game was successfully updated.' if @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title, :description, :active, :image, :flash)
    end
end
