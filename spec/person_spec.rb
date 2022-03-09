require_relative 'require_helper'

RSpec.describe Person do
  before :each do
    @person = Person.new(11, 'Andre', false)
  end
  it 'Takes three parameters and returns a Person object' do
    expect(@person).to be_an_instance_of Person
  end

  it 'Check age of the person' do
    expect(@person.age).to eql 11
  end

  it 'Check name of the person' do
    expect(@person.name).to eql 'Andre'
  end

  it 'Check parent permission of the person' do
    expect(@person.parent_permission).to be_falsey
  end

  it 'Name validator works properly' do
    expect(@person.validate_name).to eql 'Andre'
  end

  it 'Age validator works properly' do
    expect(@person.can_use_services?).to be_falsey
  end
end