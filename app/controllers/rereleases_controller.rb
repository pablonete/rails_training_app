class RereleasesController < ApplicationController
  def new
    render locals: { movie: movie }
  end

  def create
    new_movie = movie.rerelease(year: params[:year])

    redirect_to new_movie
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end
end