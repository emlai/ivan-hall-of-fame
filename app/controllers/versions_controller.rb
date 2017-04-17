class VersionsController < ApplicationController
  def index
  end

  def show
    @version = Version.find_by_string(params[:id])
    @scores = Score.sorted(version: @version)
  end
end
