require 'rails_helper'

  describe Subsidiary do
    it 'name cannot be blank' do
      subsidiary = Subsidiary.new(name: '')
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('Não podem existir campos em branco')
    end   
  end
