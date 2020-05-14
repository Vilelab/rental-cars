class Subsidiary < ApplicationRecord
  validates :name, :cnpj, uniqueness: true
  validates :name, :cnpj, :address, presence: true
  #validates :name, :cnpj, uniqueness: { message: 'Nome e CNPJ devem ser únicos' }
  #validates :name, :cnpj, presence: { message: 'Não podem existir campos em branco'}
  validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/ } 
  validate :cnpj_must_be_valid

  private

  def cnpj_must_be_valid
    unless CNPJ.valid?(cnpj, strict: true)
      errors.add(:cnpj, :invalid)
    end
  end

end
