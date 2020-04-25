require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    # Arrange
    Carcategory.create!(name: 'A', daily_rate: 50)
    Carcategory.create!(name: 'B', daily_rate: 70)

    # Act
    visit root_path
    click_on 'Categorias de Carros'

    # Assert
    expect(page).to have_content 'Categoria A'
    expect(page).to have_content '$50.00'
    
    expect(page).to have_content 'Categoria B'
    expect(page).to have_content '$70.00'
  end

  scenario 'view car category details' do
    # Arrange
    Carcategory.create!(name: 'A', daily_rate: 50, car_insurance: 40, third_part_insurance: 30)

    # Act
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Categoria A'

    # Assert
    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Diária: $50.00')
    expect(page).to have_content('Seguro do Carro: $40.00')
    expect(page).to have_content('Seguro para Terceiros: $30.00')
  end

  scenario 'empty list' do
    visit root_path
    click_on 'Categorias de Carros'

    expect(page).to have_content('Nenhuma categoria cadastrada')
  end
end
