require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new volunteer', {:type => :feature}) do
  it('allows a user to add a volunteer and see details for it') do
    visit('/')
    click_link('Add New Volunteer')
    fill_in('name', :with =>'Brian')
    click_button('Add')
    expect(page).to have_content('Brian')
  end
end
