class Rerelease
  include ActiveModel::Model
  attr_accessor :original, :params
  validates_presence_of :year

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
    return false unless valid?

    @result = original.dup
    @result.year = params[:year]
    @result.save!
  end
end