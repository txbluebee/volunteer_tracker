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

  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    end
    found_project
  end

  def update(attributes)
    @description = attributes.fetch(:description)
    @id = self.id()
    DB.exec("UPDATE projects SET description = '#{@description}' WHERE id = #{@id} ;")
  end

  def volunteers
    volunteers_in_project = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    project_volunteers = []
    volunteers_in_project.each() do |volunteer|
      name = volunteer.fetch('name')
      project_id = self.id().to_i()
      project_volunteers.push(Volunteer.new({:name => name, :project_id => project_id}))
    end
    project_volunteers
  end
end
