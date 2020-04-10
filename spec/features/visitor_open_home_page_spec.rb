require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path #metodos com _path ou _url na frente sempre apontam para uma rota! -> é uma ROTA!!! 

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')
  end
end
