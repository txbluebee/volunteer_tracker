require('spec_helper')

describe(Project) do
  describe('#initialize') do
    it('returns the description of the project') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      expect(test_project.description()).to(eq("Clean Up Seattle"))
    end
  end

  describe('#==') do
    it('is equel to another_project with same id and description') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project2 = Project.new({:description => "Clean Up Seattle", :id => nil})
      expect(test_project).to(eq(test_project2))
    end
  end

  describe('.all') do
    it('returns the array of all projects') do
      expect(Project.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the project to the array of all projects') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      expect(Project.all).to(eq([test_project]))
    end
  end

  describe('#id') do
    it('returns the id for the project') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      expect(test_project.id()).to(be_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('find the project based on its id number') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      expect(Project.find(test_project.id)).to(eq(test_project))
    end
  end

  describe('#update') do
    it('lets you update the description of the project') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      test_project.update({:description => "Clean Up Portland"})
      expect(test_project.description).to(eq("Clean Up Portland"))
    end
  end

  describe('#volunteers') do
    it('retuns the volunteers for the project') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      test_volunteer = Volunteer.new({:name => 'Brian', :project_id => test_project.id()})
      test_volunteer.save()
      test_volunteer2 = Volunteer.new({:name => 'Lily', :project_id => test_project.id()})
      test_volunteer2.save()
      expect(test_project.volunteers()).to(eq([test_volunteer, test_volunteer2]))
    end
  end

  describe('#delete') do
    it('deletes the project from array of all projects') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      test_project2 = Project.new({:description => "Clean Up Portland", :id => nil})
      test_project2.save()
      test_project.delete()
      expect(Project.all()).to(eq([test_project2]))
    end

    it('deletes the volunteers under deleted project') do
      test_project = Project.new({:description => "Clean Up Seattle", :id => nil})
      test_project.save()
      test_volunteer = Volunteer.new({:name => 'Brian', :project_id => test_project.id()})
      test_volunteer.save()
      test_volunteer2 = Volunteer.new({:name => 'Lily', :project_id => test_project.id()})
      test_volunteer2.save()
      test_project.delete()
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
