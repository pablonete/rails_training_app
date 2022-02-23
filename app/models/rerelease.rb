class Rerelease
  attr_accessor :original, :params

  def initialize(original, params)
    @original = original
    @params = params
  end

  def id
    @result.id
  end

  def save
    @result = original.dup.tap do |rerelease|
      rerelease.year = params[:year]
      rerelease.save!  
    end
  end
end