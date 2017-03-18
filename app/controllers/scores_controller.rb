class ScoresController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def csv
    csv_string = Score.sorted.map { |s| "\n#{s.points},\"#{s.character}, #{s.entry}\"" }.join
    render plain: csv_string
  end

  def submit_score
    character, entry = params[:entry].split(", ", 2)
    Score.create(points: params[:score], character: character, entry: entry)
    head :ok, content_type: "text/html"
  end
end
