class Volunteer
  attr_accessor(:id, :name, :project_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(another_volunteer)
    (self.id() == another_volunteer.id()) &&
    (self.name() == another_volunteer.name()) && (self.project_id == another_volunteer.project_id())
  end

  def self.all
    volunteers_in_db = DB.exec("SELECT * FROM volunteers;")
    all_volunteers = []
    volunteers_in_db.each() do |volunteer|
      id = volunteer.fetch('id').to_i()
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i()
      each_volunteer = Volunteer.new({:id => id, :name => name, :project_id => project_id})
      all_volunteers.push(each_volunteer)
    end
    all_volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id() == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end


  def update(attributes)
    @project_id = attributes.fetch(:project_id)
    @id = self.id()
    DB.exec("UPDATE volunteers SET project_id = #{@project_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end

  def project
    project_id = self.project_id
    if project_id != 0
      result = DB.exec("SELECT * FROM projects WHERE id = #{project_id};")
      description = result.first().fetch('description')
    else
      "No project assigned"
    end
  end
end
