
class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category

  before_create :generate_code

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase #atribuição demanda o self... fosse comparação não precisaria
  end
end
