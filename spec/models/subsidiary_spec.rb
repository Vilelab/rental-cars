require 'rails_helper'

  describe Subsidiary do
    it 'name cannot be blank' do
      subsidiary = Subsidiary.new(name: '')
      subsidiary.valid? #veja so... não precisamos salvar no banco, apenas usar o metodo
      expect(subsidiary.errors[:name]).to include('Não podem existir campos em branco')
    end   

    it 'name must be unique' do
      Subsidiary.create!(name: 'Paulista', cnpj: '73.351.325/0001-92')
      subsidiary = Subsidiary.new(name: 'Paulista')
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('Nome e CNPJ devem ser únicos')
    end

    it 'cnpj cannot be blank' do
      subsidiary = Subsidiary.new(cnpj: '')
      subsidiary.valid? 
      expect(subsidiary.errors[:cnpj]).to include('Não podem existir campos em branco')
    end   

    it 'cnpj must be unique' do
      Subsidiary.create!(name: 'Paulista', cnpj: '73.351.325/0001-92')
      subsidiary = Subsidiary.new(cnpj: '73.351.325/0001-92')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('Nome e CNPJ devem ser únicos')
    end      

    it 'cnpj must be valid format' do
      subsidiary = Subsidiary.new(cnpj: '73.351.325/0001-92')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('Não é válido')
    end

    it 'cnpj must be valid format' do
      subsidiary = Subsidiary.new(cnpj: '73351325000192')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('Não é válido')
    end

  end
