class RereleasesController < ApplicationController
  def new
    rerelease = Rerelease.new(movie, {})
    render locals: { rerelease: rerelease }
  end

  def create
    rerelease = Rerelease.new(movie, rerelease_params)
    rerelease.save

    redirect_to movie_path(rerelease.id)
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def rerelease_params
    params.require(:rerelease).permit(:year)
  end
end