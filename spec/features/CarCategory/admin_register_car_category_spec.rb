require 'rails_helper'

feature 'Admin register carcategory' do
  scenario 'from index page' do
    visit root_path
    click_on 'Categorias de Carros'

    expect(page).to have_link('Registrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '50'
    fill_in 'Seguro do carro', with: '40'
    fill_in 'Seguro contra terceiros', with: '20'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('A')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('R$ 40,00')
    expect(page).to have_content('R$ 20,00')
    expect(page).to have_link('Voltar')
  end
end
