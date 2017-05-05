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
end
