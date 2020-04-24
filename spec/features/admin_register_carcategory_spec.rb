require 'rails_helper'

feature 'Admin register carcategory' do
  scenario 'from index page' do
    visit root_path
    click_on 'Categorias de Carros'

    expect(page).to have_link('Registrar nova categoria', href: new_carcategory_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '50.0'
    fill_in 'Seguro do carro', with: '4000.0'
    fill_in 'Seguro contra terceiros', with: '2000.0'
    click_on 'Enviar'

    expect(current_path).to eq carcategory_path(Carcategory.last.id)
    expect(page).to have_content('A')
    expect(page).to have_content('50.0')
    expect(page).to have_content('4000.0')
    expect(page).to have_content('2000.0')
    expect(page).to have_link('Voltar')
  end
end
