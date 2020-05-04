require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and name must be unique' do
    Subsidiary.create(name: 'Jandira', cnpj: '1234567891123', 
                      address: 'Rua das tramóias')
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Jandira'
    fill_in 'CNPJ', with: '1234567891123'
    fill_in 'Endereço', with: 'Rua das tramóias'
    click_on 'Enviar'

    expect(page).to have_content('Nome e CNPJ devem ser únicos')
  end

  scenario 'and cnpj must be unique' do
    Subsidiary.create(name: 'Jandira', cnpj: '1234567891123', 
                      address: 'Rua das tramóias')
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Carapiru'
    fill_in 'CNPJ', with: '1234567891123'
    fill_in 'Endereço', with: 'Rua das tramóias'
    click_on 'Enviar'

    expect(page).to have_content('Nome e CNPJ devem ser únicos')
  end

  scenario 'and name can not be blank' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não podem existir campos em branco')
  end

  scenario 'and cnpj can not be blank' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'CNPJ', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não podem existir campos em branco')
  end
end
