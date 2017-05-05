require('spec_helper')

describe(Volunteer) do
  describe('#name') do
    it('returns the name of the volunteer') do
      test_volunteer = Volunteer.new({:name => 'Brian', :project_id => 1})
      expect(test_volunteer.name()).to(eq('Brian'))
    end
  end


end
