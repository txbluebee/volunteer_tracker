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

end
