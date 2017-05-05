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

describe('edit volunteer info', {:type => :feature}) do
  it('allows a user to update the name of volunteer') do
    test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
    test_volunteer.save()
    visit('/volunteers/:id')
    click_button('Edit')
    fill_in('name', :with => 'Lily')
    click_button('Update')
    expect(page).to have_content('Lily')
  end
end
