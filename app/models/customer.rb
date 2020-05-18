class Customer < ApplicationRecord
  has_many :rentals
  has_many :car_categories

  def self.search(query) #self diz que trata-se de um método de classe...
                         #é um met. de classe porque vamos usá-lo em todas as instâncias de customer...
    scope :search, ->(query) { where('name LIKE ?', "%#{query}%")
                               .or(where(document: query)) }
  end  
end
