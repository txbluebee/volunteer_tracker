class Project
  attr_accessor(:id, :description)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  def ==(another_project)
    (self.id() == another_project.id()) && (self.description() == another_project.description())
  end

  def self.all
    projects_in_db = DB.exec("SELECT * FROM projects;")
    all_projects = []
    projects_in_db.each() do |project|
      id = project.fetch('id').to_i()
      description = project.fetch('description')
      all_projects.push(Project.new(:id => id, :description => description))
    end
    all_projects
  end

  def save
    result = DB.exec("INSERT INTO projects (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end


end
