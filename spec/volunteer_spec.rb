require('spec_helper')

describe(Volunteer) do
  describe('#name') do
    it('returns the name of the volunteer') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      expect(test_volunteer.name()).to(eq('Brian'))
    end
  end

  describe('#==') do
    it('is equal to another volunteer with same name and project_id') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      test_volunteer2 = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      expect(test_volunteer).to(eq(test_volunteer2))
    end
  end

  describe('.all') do
    it('returns the array of all volunteers') do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the volunteer to the array of all volunteers') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      test_volunteer.save()
      test_volunteer2 = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 2})
      test_volunteer2.save()
      expect(Volunteer.all).to(eq([test_volunteer, test_volunteer2]))
    end
  end

  describe('#id') do
    it('returns id number as integer class') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      test_volunteer.save()
      expect(test_volunteer.id()).to(be_instance_of(Fixnum))
    end
  end

  describe('#update') do
    it('lets you update the name of volunteers') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      test_volunteer.save();
      test_volunteer.update({:name => 'Lily'})
      expect(test_volunteer.name()).to(eq('Lily'))
    end
  end

  describe('#delete') do
    it('lets you delte the volunteer') do
      test_volunteer = Volunteer.new({:id=> nil, :name => 'Brian', :project_id => 1})
      test_volunteer.save();
      test_volunteer.delete()
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
