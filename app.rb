require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker_test"})

#Home Page
get('/') do
  erb(:index)
end

#Add volunteer
get('/volunteers/new') do
  erb(:volunteer_form)
end

#Post new volunteer
post('/volunteers') do
  name = params.fetch('name')
  new_volunteer = Volunteer.new({:id => nil, :name => name})
  new_volunteer.save()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

#View all volunteers
get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end
