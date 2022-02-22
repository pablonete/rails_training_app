class RereleasesController < ApplicationController
  def create
    origin = Movie.find(params[:movie_id])

    new_movie = origin.dup
    new_movie.year = params[:year]
    new_movie.save!

    redirect_to new_movie
  end
end