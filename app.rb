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

#View individual volunteer
get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  erb(:volunteer)
end

#Edit individual volunteer
get('/volunteers/:id/edit') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  erb(:volunteer_edit_form)
end

#Update name for volunteer
patch('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  new_name = params.fetch('name')
  @volunteer.update({:name => new_name})
  erb(:volunteer)
end

#Delete volunteer
delete('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

#Add project
get('/projects/new') do
  erb(:project_form)
end

#Post new project
post('/projects') do
  description = params.fetch('description')
  new_project = Project.new({:id => nil, :description => description})
  new_project.save()
  @projects = Project.all()
  erb(:projects)
end

#View all projects
get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

#View individual project
get('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  erb(:project)
end

#Post new volunteers to project
post('/project_volunteers') do
  name = params.fetch('name')
  project_id = params.fetch('project_id').to_i()
  new_volunteer = Volunteer.new({:id => nil, :name => name, :project_id => project_id})
  new_volunteer.save()
  @volunteers = Volunteer.all()
  @project = Project.find(project_id);
  erb(:project)
end


#Edit individual project
get('/projects/:id/edit') do
  @project = Project.find(params.fetch('id').to_i())
  erb(:project_edit_form)
end

#Update project description
patch('/projects/:id') do
  description = params.fetch('description')
  @project = Project.find(params.fetch('id').to_i())
  @project.update({:description => description})
  erb(:project)
end

#delete project
delete('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
