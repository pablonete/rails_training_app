class Rerelease
  attr_accessor :original, :params

  def initialize(original, params)
    @original = original
    @params = params
  end

  def id
    @result.id
  end

  def year
    params[:year]
  end

  def save
    @result = original.dup
    @result.year = params[:year]
    @result.save!  
  end
end