class RereleasesController < ApplicationController
  def new
    rerelease = Rerelease.new(movie, {})
    render locals: { rerelease: rerelease }
  end

  def create
    rerelease = Rerelease.new(movie, rerelease_params)
    if rerelease.save
      redirect_to movie_path(rerelease.id)
    else
      render "new", locals: { rerelease: rerelease }
    end
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def rerelease_params
    params.require(:rerelease).permit(:year)
  end
end