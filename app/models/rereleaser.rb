class Rereleaser
  def initialize(movie)
    @movie = movie
  end

  def run(params)
    @movie.dup.tap do |rerelease|
      rerelease.year = params[:year]
      rerelease.save!  
    end
  end
end