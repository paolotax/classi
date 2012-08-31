class ClassiInserter

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :classe, :sezioni, :nr_alunni, :libro_id
  
  validates_presence_of :classe, :sezioni, :nr_alunni
  
  validates_format_of :sezioni, :with => /[a-zA-z]/, message: "cazzone carattere non valido"
  
  validate :check_sezioni
  
  
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def nr_sezioni
    self.sezioni.size
  end
  
  def totale_alunni
    self.nr_alunni.split(" ").map { |x| x.to_i}.inject(:+)
  end
  
  def media_alunni
    self.totale_alunni / self.nr_sezioni
  end
  
  def resto_alunni
    self.totale_alunni % self.nr_sezioni
  end
  
  def sezioni_alunni_mappings
    sez_ar = self.sezioni.split("")
    alu_ar = self.nr_alunni.split(" ")
    mappings = []
    if sez_ar.size == alu_ar.size
      sez_ar.each_with_index {|s, index| mappings << { s => alu_ar[index].to_i } }
    else
      sez_ar.each { |s| mappings << { s => self.media_alunni } }
      (1..self.resto_alunni).each_with_index do |i, index| 
        mappings[index].each do |k, v|
          mappings[index][k] = v + 1
        end  
      end

    end  
    mappings
  end
  
  def insert_classi
    self.sezioni_alunni_mappings.each_with_index do |m|
      @classe = Classe.create(
        classe: self.classe,
        sezione: m.keys[0].upcase,
        nr_alunni: m.values[0]
      )
      @classe.adozioni.create(libro_id: self.libro_id) if self.libro_id
    end  
  end  

  def persisted?
    false
  end
  
  private
    
    def check_sezioni
      sez_ar = self.sezioni.split("")
      sez_ar.each do |sezione|
        if self.sezioni.downcase.count(sezione.downcase) > 1
          errors.add :sezioni, "errore"
        end
      end  
    end
    
  
end