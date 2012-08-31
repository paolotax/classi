class Libro < ActiveRecord::Base
  attr_accessible :titolo
  
  has_many :adozioni
  
  def to_s
    "#{titolo}"
  end
end
