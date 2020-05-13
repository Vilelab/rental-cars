require 'rails_helper' 

  feature 'Admin view car models' do
    scenario 'successfully' do
      
      #Arrange

      fiat = Manufacturer.create!(name: "Fiat")
      ford = Manufacturer.create!(name: "Ford")
      category = CarCategory.create!(name: "A", daily_rate: 50, car_insurance: 40, 
                                  third_part_insurance: 30)
      CarModel.create!(name: "Uno", year: "2020", manufacturer: fiat, car_category: category, motorization: '1.0', fuel_type: 'Flex')
      CarModel.create!(name: "Ka" , year: "2021", manufacturer: ford, car_category: category, motorization: '1.0', fuel_type: 'Flex')

      #Act
      visit root_path
      click_on "Modelos de Carros"
      #click_on "details-#{cm.id}" ou find{"a#details-#{cm.id}"}.click{}

      #Assert
      expect(page).to have_content 'Fiat'
      expect(page).to have_content 'Uno'
      expect(page).to have_content '2020'

      expect(page).to have_content 'Ford'
      expect(page).to have_content 'Ka'
      expect(page).to have_content '2021'
    end

    scenario 'no car models' do
    end

    scenario 'and view details' do

      #Arrange
            
      fiat  = Manufacturer.create!(name: "Fiat")
      cat_a = CarCategory.create!(name: "A", daily_rate: 50, car_insurance: 40, 
                                  third_part_insurance: 30)

      CarModel.create!(name: "Uno", year: "2020", manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
      
      #Act
      visit root_path
      click_on "Modelos de Carros"
      click_on "Ver Detalhes"
 
      #Assert
      expect(page).to have_content 'Uno'    
      expect(page).to have_content 'Fabricante: Fiat'
      expect(page).to have_content 'Ano: 2020'
      expect(page).to have_content 'Motor: 1.0'
      expect(page).to have_content 'Combustível: Flex'
      expect(page).to have_content 'Categoria: A'
      expect(page).to have_content 'Diária: R$ 50,00' 

    end
  end
