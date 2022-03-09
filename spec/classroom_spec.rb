require_relative 'require_helper'

RSpec.describe Classroom do
  before :each do
    @mathematics = Classroom.new('mathematics')
    @student1 = Student.new(25, 'Luis', false)
    @student2 = Student.new(23, 'Mary', true)
    @student1.classroom = (@mathematics)
  end

  it 'Takes one valid parameters and returns a Classroom object' do
    expect(@mathematics).to be_an_instance_of Classroom
    expect(@mathematics.label).to eql 'mathematics'
  end

  it 'Check for the number of students to be 1' do
    expect(@mathematics.students.length).to eql 1
  end

  it 'Check for the number of students to be 2 after being added one student' do
    @student2.classroom = (@mathematics)
    expect(@mathematics.students.length).to eql 2
  end

  it 'Check for the name of both students after being added to classroom object' do
    @student2.classroom = (@mathematics)
    expect(@mathematics.students[0].name).to eql 'Luis'
    expect(@mathematics.students[1].name).to eql 'Mary'
  end
end
