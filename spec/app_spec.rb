require_relative'../lib/app'

describe 'the_super_method of app.rb' ! do
  it 'should return the result of a test on a def !' do
  expect(the_super_method(variable)).to eq(résultat_attendu)
  end
  it 'should return the result of an other test on a def !' do
  expect(the_super_method(variable)).to eq(résultat_attendu)
  end
end
