require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'
    fill_in 'Nome', with: 'Itu'
    fill_in 'CNPJ', with: '41.186.422/0001-80'
    fill_in 'Endereço', with: 'Rua das monções'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Itu')
    expect(page).to have_content('41.186.422/0001-80')
    expect(page).to have_content('Rua das monções')
    expect(page).to have_link('Voltar')
  end
end
