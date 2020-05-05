require 'rails_helper'

feature 'admin register car models' do
   scenario 'successfully' do
     manufacturer = Manufacturer.create!(name: 'Fiat')
     carcategory  = Carcategory.create!(name: 'A', daily_rate: 100,
					third_part_insurance: 100)

     visit root_path
     click_on 'Modelos de Carros'
     click_on 'Registrar modelo de carro'
     fill_in 'Nome',        with: 'Uno'
     fill_in 'Ano' ,        with: '2020'
     fill_in 'Motor',       with: '2.0'
     fill_in 'Combustível', with: 'Flex'
     select 'Fiat', from: 'Fabricante'
     select 'A', from: 'Categoria'
     click_on 'Enviar'

     expect(page).to have_content('Modelo de Carro Uno')
     expect(page).to have_content('Fiat')
     expect(page).to have_content('2020')
     expect(page).to have_content('2.0')
     expect(page).to have_content('$100.00')
     expect(page).to have_content(/A/)
   end

end
