require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Itu', cnpj: '41.186.422/0001-80', address: 'Rua das monções')
    Subsidiary.create!(name: 'Santos', cnpj: '62.828.493/0001-00', address: 'Estrada das lágrimas')

    visit root_path
    click_on 'Filiais'
    
    expect(page).to have_content('Itu 41.186.422/0001-80 Rua das monções')
    expect(page).to have_content('Santos 62.828.493/0001-00 Estrada das lágrimas')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Itu', cnpj: '41.186.422/0001-80', address: 'Rua das monções')
    Subsidiary.create!(name: 'Santos', cnpj: '62.828.493/0001-00', address: 'Estrada das lágrimas')

    visit root_path
    click_on 'Filiais'
    click_on 'Itu'

    expect(page).to have_content('Itu')
    expect(page).not_to have_content('Santos')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Itu', cnpj: '41.186.422/0001-80', address: 'Rua das monções')
    Subsidiary.create!(name: 'Santos', cnpj: '62.828.493/0001-00', address: 'Estrada das lágrimas')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Itu', cnpj: '41.186.422/0001-80', address: 'Rua das monções')
    Subsidiary.create!(name: 'Santos', cnpj: '62.828.493/0001-00', address: 'Estrada das lágrimas')

    visit root_path
    click_on 'Filiais'
    click_on 'Itu'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
