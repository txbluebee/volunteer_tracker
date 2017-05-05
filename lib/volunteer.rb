class Volunteer
  attr_accessor(:name, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(another_volunteer)
    (self.name() == another_volunteer.name()) && (self.project_id == another_volunteer.project_id())
  end

  def self.all
    volunteers_in_db = DB.exec("SELECT * FROM volunteers;")
    all_volunteers = []
    volunteers_in_db.each() do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i()
      each_volunteer = Volunteer.new({:name => name, :project_id => project_id})
      all_volunteers.push(each_volunteer)
    end
    all_volunteers
  end

  def save
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id});")
  end

end
