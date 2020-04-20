require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Diadema', cnpj: '13537', address: 'Rua das tramoias 171')

    visit root_path
    click_on 'Filiais'
    click_on 'Diadema'
    click_on 'Editar'
    fill_in 'Nome', with: 'São Bernardo'
    fill_in 'CNPJ', with: '44444'
    fill_in 'Endereço', with: 'Rua dos tupis 64'
    click_on 'Enviar'

    expect(page).to have_content('São Bernardo')
    expect(page).to have_content('44444')
    expect(page).to have_content('Rua dos tupis 64')
    
  end
end
