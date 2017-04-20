class PlayersController < ApplicationController
  def index
  end
  
  def show
    @player = Player.find_by_name(params[:id])
    @scores = Score.sorted(player: @player)
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
    player = authenticate_with_http_basic do |username, password|
      Player.find_by(name: username)&.authenticate(password)
    end

    if player
      render plain: player.auth_token
    else
      request_http_basic_authentication
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :attnam_username, :password, :password_confirmation)
  end
end
