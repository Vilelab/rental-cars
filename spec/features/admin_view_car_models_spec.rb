require 'rails_helper' 

  feature 'Admin view car models' do
    scenario 'successfully' do
      fiat = Manufacturer.create!(name: "Fiat")
      ford = Manufacturer.create!(name: "Ford")
      
      #Arrange
      CarModel.create!(name: "Uno", year: "2020", manufacturer: fiat)
      CarModel.create!(name: "Ka" , year: "2021", manufacturer: ford)


      #Act
      visit root_path
      click_on "Modelos de Carros"

      #Assert
      expect(page).to have_content 'Fiat'
      expect(page).to have_content 'Uno'
      expect(page).to have_content '2020'

      expect(page).to have_content 'Ford'
      expect(page).to have_content 'Ka'
      expect(page).to have_content '2021'
    end
  end
