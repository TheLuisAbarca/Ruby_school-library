require_relative 'require_helper'

RSpec.describe Classroom do
    before :each do
      @Mathematics = Classroom.new('Mathematics')
      @student1 = Student.new(25, 'Luis', false)
      @student2 = Student.new(23, 'Mary', true)
      @student1.classroom=(@Mathematics)
    end

    it 'Takes one valid parameters and returns a Classroom object' do
      expect(@Mathematics).to be_an_instance_of Classroom
      expect(@Mathematics.label).to eql 'Mathematics'
    end
  
    it 'Check for the number of students to be 1' do
      expect(@Mathematics.students.length).to eql 1
    end
  
    it 'Check for the number of students to be 2 after being added one student' do
      @student2.classroom=(@Mathematics)
      expect(@Mathematics.students.length).to eql 2
    end

    it 'Check for the name of both students after being added to classroom object' do
      @student2.classroom=(@Mathematics)
      expect(@Mathematics.students[0].name).to eql 'Luis'
      expect(@Mathematics.students[1].name).to eql 'Mary'
    end
end