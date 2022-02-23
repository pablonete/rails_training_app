class RereleasesController < ApplicationController
  def new
    render locals: { movie: movie }
  end

  def create
    rereleaser = Rereleaser.new(movie)
    rerelease = rereleaser.run(rerelease_params)

    redirect_to rerelease
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def rerelease_params
    params.require(:rerelease).permit(:year)
  end
end