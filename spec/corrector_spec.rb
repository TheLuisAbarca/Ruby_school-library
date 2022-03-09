require_relative 'require_helper'

RSpec.describe Corrector do
  it 'Changes carlos to Carlos' do
    test = Corrector.new.correct_name('carlos')
    expect(test).to eql 'Carlos'
  end

  it 'Changes 1234567890123 to 1234567890' do
    test = Corrector.new.correct_name('1234567890123')
    expect(test).to eql '1234567890'
  end

  it 'Changes schlumberger to Schlumberg' do
    test = Corrector.new.correct_name('schlumberger')
    expect(test).to eql 'Schlumberg'
  end
end
