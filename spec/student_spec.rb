require_relative 'require_helper'

RSpec.describe Student do
  before :each do
    @student = Student.new(21, 'Luis', false)
    @classroom = Classroom.new('Time Traveling')
  end
  it 'Takes three parameters and returns a Student object' do
    expect(@student).to be_an_instance_of Student
  end

  it 'Check age of the student' do
    expect(@student.age).to eql 21
  end

  it 'Check name of the person' do
    expect(@student.name).to eql 'Luis'
  end

  it 'Student is able to play hooky' do
    expect(@student.play_hooky).to eql '"¯\(ツ)/¯"'
  end

  it 'Student is able to join a classroom' do
    @student.classroom = @classroom
    expect(@student.classroom.label).to eql 'Time Traveling'
  end
end