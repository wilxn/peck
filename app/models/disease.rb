class Disease < ActiveRecord::Base
  has_many :keyword
  has_many :sport
  has_many :food
  has_many :psy
  
  def Disease.getDiseasebyId(id)
    disease = find_by_id(id)
    disease
  end
  searchable do
    text :symp,:stored => true
    text :name,:stored => true
    text :defi,:stored => true
    #:signal,:symp,:name,:defi,:divi,:factor,:stored => true
  end
end
