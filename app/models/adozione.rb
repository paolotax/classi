class Adozione < ActiveRecord::Base
  
  attr_accessible :libro_id, :nr_copie
  
  belongs_to :libro
  belongs_to :classe
  
end
