require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "rerelease a movie" do
    old_movie = create(:movie, title: "Movie", year: "1980")

    new_movie = Rereleaser.new(old_movie).run(year: "2022")

    refute_equal new_movie.id, old_movie.id

    old_movie.reload
    assert_equal "1980", old_movie.year
    assert_equal "2022", new_movie.year
  end

  test "rerelease creates a copy of the movie with the specified year" do
    movie = create(:movie, year: "1992")

    assert_difference(-> { Movie.where(title: movie.title).count }, 1) do
      Rereleaser.new(movie).run(year: 2019)
    end

    rerelease = Movie.find_by(title: movie.title, year: 2019)
    assert_equal "2019", rerelease.year
  end
end
