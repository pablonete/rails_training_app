class RereleasesController < ApplicationController
  def create
    origin = Movie.find(params[:movie_id])

    new_movie = origin.rerelease(params[:year])

    redirect_to new_movie
  end
end