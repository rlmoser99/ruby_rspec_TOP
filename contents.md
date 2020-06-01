# let variables
let(:card) { Card.new('Ace', 'Spades') }

# parameters of variables that can change
expect(card.rank).to eq('Ace')
card.rank = 'Queen'
expect(card.rank).to eq('Queen')

# A custom error message, gives you the ability to provide "documentation" material on what should be happening.
comparison = 'Spade'
expect(card.suit).to eq(comparison), Expected #{comparison}, not #{card.suit}."

# Don't put conditional information in the 'it' string
context 'with even number' do
  it 'should return true' do

# Before and After Hooks
before(:context) do
  puts 'Before Context Hook - use case: to open a database connection'
end
after(:context) do
  puts 'After Context Hook - use case: to close a database connection'
end
before(:example) do
  puts 'Before Example Hook'
end
after(:example) do
  puts 'After Example Hook'
end

# default parameters - test without & with parameter
let(:language) { ProgrammingLanguage.new('Python') }
expect(language.name).to eq('Python')
let(:language) { ProgrammingLanguage.new }
expect(language.name).to eq('Ruby')

# If an object can be initialized without parameters, 'subject' will be an instance of the class declared after describe 
describe Hash do
expect(subject.length).to eq(0)

# Subject resets between each example

# described_class = Ensure for future class name changes
subject { described_class.new('Boris') }

# one-lines syntex
it { is_expected.to eq(5) }

# shared_examples (maybe with polymorphism)
shared_context possible. not sure of use cases.

# .not_to can be used with any of the other matchers
expect('Hello').not_to eq('hello')
expect(10).not_to be_odd
expect([1, 2, 3]).not_to be_empty
expect(nil).not_to be_truthy
expect('Philadelphia').not_to start_with('car')
expect(5).not_to respond_to(:length)
expect(%i[a b c]).not_to include(:d)

using this as a .not_to is fine. Not when you are testing for a specific error, you should be explicit with a specific error name.
expect { 11 / 3 }.not_to raise_error

# Equality Matchers
equal and be are the same - some people prefer to use 'be' over 'equal' because the name implies same object expect(first).to be(second)
equal is checking for equal object identity (every object of the same class, are different objects)
eq      value
eql     value + type
equal   object identity
be      object identity

describe 'equal and be matcher' do
  let(:c) { [1, 2, 3] }
  let(:d) { [1, 2, 3] }
  let(:e) { c }

  it 'cares about object identity' do
    expect(c).to eq(d)
    expect(c).to eql(d)

    expect(c).to equal(e)
    expect(c).to be(e)

    expect(c).not_to equal(d)
    expect(c).not_to equal([1, 2, 3])
  end
end

# Comparison Matchers
expect(22).to be <= 100
it { is_expected.to be > 90 }

# predicate methods
result = 16 / 2
expect(result.even?).to eq(true)
expect(16 / 2).to be_even
expect(15).to be_odd
expect(0).to be_zero
expect([]).to be_empty

# Using 'all'
expect([5, 7, 9, 13]).to all(be_odd)
expect([4, 6, 8, 10]).to all(be_even)
expect([[], [], []]).to all(be_empty)
expect([0, 0]).to all(be_zero)

# Put objects in describe
describe [5, 7, 9] do
  it { is_expected.to all(be_odd) }
  it { is_expected.to all(be < 10) }
end

# truthy and falsey
expect(true).to be_truthy
expect('Hello').to be_truthy
expect(5).to be_truthy
expect(0).to be_truthy
expect(-1).to be_truthy
expect([]).to be_truthy
expect([1, 2]).to be_truthy
expect({}).to be_truthy
expect(:symbol).to be_truthy
expect(false).to be_falsy
expect(nil).to be_falsy
my_hash = { a: 5 }
expect(my_hash[:b]).to be_nil

# change matcher (syntex can be too tightly coupled to the subject)
expect { subject.pop }.to change { subject.length }.from(4).to(3)
expect { subject.pop }.to change { subject.length }.by(-1)
expect { do_something }.to change(something).to(new_value)

# contain exactly
subject { [1, 2, 3] }
expect(subject).to contain_exactly(1, 2, 3)
it { is_expected.to contain_exactly(3, 1, 2) }

# start_with and end_with
describe [:a, :b, :c, :d] do
expect(subject).to start_with(:a)
expect(subject).to start_with(:a, :b)
expect(subject).to start_with(:a, :b, :c)
expect(subject).to end_with(:d)
expect(subject).to end_with(:c, :d)

# have_attributes
describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do
expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner') }

# include matcher
expect(subject).to include('late')
it { is_expected.to include('choc') }

# specific or custom errors
expect { some_method }.to raise_error(NameError)
expect { 10 / 0 }.to raise_error(ZeroDivisionError)
expect { raise CustomError }.to raise_error(CustomError)


# polymorphism - (many shapes)
we shouldn't worry about about kind of object is, but what is can respond to...
It doesn't matter if we are responding to HotChocolate, Coffee, or Milk
This is a great way to test different class types with the same methods.
This literally just tests in a method exists on a object.
expect(subject).to respond_to(:drink, :discard, :purchase)
expect(subject).to respond_to(:purchase).with(1).arguments

# satisfy
(rubocop does not like the one-line)
expect(subject).to satisfy { |value| value == value.reverse }

When the test fails with 'racecars', this test will generate it's own message in a more readable format to clearly communicate the error.
it 'can accept a custom error message' do
  expect(subject).to satisfy('be a palindrome') do |value|
    value == value.reverse
  end
end

# compound expectations
RSpec.describe 'caterpillar' do
it { is_expected.to start_with('cat').and end_with('pillar') }
expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
expect(subject).to include(42).and start_with(4, 8, 15)
expect(subject).to be_even.and respond_to(:times)

# START ON FILE #28

stubs double - use when an object is needed to provide something that takes time (database call)

http://testing-for-beginners.rubymonstas.org/test_doubles.html

From http://www.betterspecs.org/#describe
  expect(response).to respond_with_content_type(:json)
  expect(response).to assign_to(:resource)

# Seen in TOP student project. That I don't understand fully:
game.instance_variable_set
expect(STDOUT).to receive(:puts).at_least(:twice)
expect(game.intro).not_to raise_error

# Rspec & Rubocop Style Guide:

expect(foo).to receive(:bar).once
expect(foo).to receive(:bar).twice
expect(foo).to receive(:bar).at_least(:once)
expect(foo).to receive(:bar).at_least(:twice)
expect(foo).to receive(:bar).at_most(:once)


Prefer instance doubles over stubbing any instance of a class
let(:my_instance) { instance_double(MyClass) }
allow(MyClass).to receive(:new).and_return(my_instance)
allow(my_instance).to receive(:foo)

let(:foo) do
  instance_double("ClassName", method_name: 'returned value')
end

# context should not be used for specifying methods.
describe '#foo_bar' do (YES)
context '#foo_bar' do (NO)

# context start with
- when
- with
- without
- if
- unless
- for
Other acceptable prefixes may include if, unless, for, before, after, or during.

# Check that the first argument to the top level describe is a constant.
describe TestedClass do

# Add method name to subject
describe MyClass do
  subject { described_class.do_something }
end
subject { MyClass.do_something }

# RSpec/DescribedClassModuleWrapping
RSpec.describe MyModule::MyClass do
  ...
end

# RSpec/ExpectOutput
expect { my_app.print_report }.to output('Hello World').to_stdout

# RSpec/InstanceSpy
foo = instance_spy(Foo)
expect(foo).to have_received(:bar)

# Skips a test ??!!!
it "should be true", skip: true do
  expect(1).to eq(2)
end
