class PlayersController < ApplicationController
  def index
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to root_url, notice: 'Player created.'
    else
      render :new
    end
  end

  def get_auth_token
    player = Player.find_by(name: params[:username])
    if player and player.authenticate(params[:password])
      return render plain: player.auth_token
    end
    head :unauthorized
  end

  private

  def player_params
    params.require(:player).permit(:name, :attnam_username, :password, :password_confirmation)
  end
end
