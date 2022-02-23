require 'test_helper'

class RereleaseTest < ActiveSupport::TestCase
  test "rerelease a movie" do
    old_movie = create(:movie, title: "Movie", year: "1980")

    new_movie = Rerelease.new(old_movie, year: "2022")
    new_movie.save

    refute_equal new_movie.id, old_movie.id

    old_movie.reload
    assert_equal "1980", old_movie.year
    assert_equal "2022", new_movie.year
  end

  test "rerelease creates a copy of the movie with the specified year" do
    movie = create(:movie, year: "1992")
    rerelease = Rerelease.new(movie, year: 2019)

    assert_difference(-> { Movie.where(title: movie.title).count }, 1) do
      assert rerelease.save
    end

    rerelease = Movie.find_by(title: movie.title, year: 2019)
    assert_equal "2019", rerelease.year
  end

  test "rerelease requires a new year" do
    movie = create(:movie, year: "1992")
    rerelease = Rerelease.new(movie, {})
    assert_equal 0, rerelease.errors.size

    refute_predicate rerelease, :save
    assert_equal 1, rerelease.errors.size
  end
end
