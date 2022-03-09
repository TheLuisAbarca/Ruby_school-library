require_relative 'require_helper'

RSpec.describe Teacher do
  before :each do
    @teacher = Teacher.new(1000, 'The Doctor', 'Time Traveling' )
  end
  it 'Takes three parameters and returns a Teacher object' do
    expect(@teacher).to be_an_instance_of Teacher
  end

  it 'Check specialization of the teacher' do
    expect(@teacher.specialization).to eql 'Time Traveling'
  end

  it 'Check age of the teacher' do
    expect(@teacher.age).to eql 1000
  end

  it 'Check name of the teacher' do
    expect(@teacher.name).to eql 'The Doctor'
  end

  it 'Can user services is always true' do
    expect(@teacher.can_use_services?).to be_truthy
  end
end