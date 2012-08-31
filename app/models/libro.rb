class Libro < ActiveRecord::Base
  attr_accessible :titolo, :classe
  
  has_many :adozioni
  
  def to_s
    "#{titolo}"
  end
end
