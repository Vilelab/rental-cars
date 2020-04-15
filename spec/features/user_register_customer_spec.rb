require 'rails_helper'

feature 'User register customer' do
  scenario 'from index page' do
    visit root_path
    click_on 'Clientes'

    expect(page).to have_link('Cadastrar um cliente', href: new_customer_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar um cliente'

    fill_in 'Nome', with 'Arnaldo'
    fill_in 'CPF' , with '222'
    fill_in 'Email', with 'arnaldo_surfista@mymail.com'
    click_on 'Enviar'

    expect(current_path).to eq customer_path(Customer.last.id)
    expect(page).to have_content('Arnaldo')
    expect(page).to have_content('222')
    expect(page).to have_content('arnaldo_surfista@mymail.com')
    expect(page).to have_link('Voltar')

  end
end
