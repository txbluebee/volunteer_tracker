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

describe('seeing all volunteers added to the project', {:type => :feature}) do
  it('allows a user to add volunteers to project and details for it') do
    test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
    test_project.save()
    test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => test_project.id()})
    test_volunteer.save()
    visit('/projects')
    click_link(test_project.description())
    expect(page).to have_content(test_volunteer.name())
  end
end
