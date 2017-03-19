class ScoresController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def csv
    csv_string = Score.sorted.map { |s| "\n#{s.points},\"#{s.character}, #{s.entry}\"" }.join
    render plain: csv_string
  end

  def submit_score
    player = Player.find_by(name: params[:username])
    if params[:username].present? && (!player || !player.authenticate(params[:password]))
      return head :unauthorized, content_type: "text/html"
    end

    character, entry = params[:entry].split(", ", 2)
    Score.create(player: player, points: params[:score], character: character, entry: entry)
    head :ok, content_type: "text/html"
  end
end
