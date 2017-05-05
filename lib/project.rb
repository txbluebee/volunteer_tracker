class Project
  attr_accessor(:id, :description)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  def ==(another_project)
    (self.id() == another_project.id()) && (self.description() == another_project.description())
  end
end
