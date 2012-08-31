class Classe < ActiveRecord::Base
  attr_accessible :classe, :cliente_id, :nr_alunni, :sezione
  
  has_many :adozioni, dependent: :destroy
  has_many :libri, through: :adozioni
end
