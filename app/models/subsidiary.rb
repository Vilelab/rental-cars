class Subsidiary < ApplicationRecord
  validates :name, :cnpj, uniqueness: { message: 'Nome e CNPJ devem ser únicos' }
  validates :name, :cnpj, presence: { message: 'Não podem existir campos em branco'}
end
