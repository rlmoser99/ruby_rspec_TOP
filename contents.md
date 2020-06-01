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

# Test object methods in isolation, we can emulate the behavior of other objects.
Real-life application - reaching out to a database to retrieve info, reach out to a server to get info, etc. So you can assume that whatever you need to do, provides you correct info.
stuntman = double('Mr. Danger')
allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
or => stuntman = double('Mr. Danger', fall_off_ladder: 'Ouch', light_on_fire: true)
expect(stuntman.fall_off_ladder).to eq('Ouch')
expect(stuntman.light_on_fire).to eq(true)

stubs double - use when an object is needed to provide something that takes time (database call)
One class shouldn't care if it is given an actual instance of an class object, but rather all it cares is that it is given an object that can respond to certain methods (polymorphism).

expect(stuntman).to receive(:light_on_fire).at_most(1).times
expect(stuntman).to receive(:fall_off_ladder).once
expect(stuntman).to receive(:act).at_least(2).times

# Stub -  We are going to stub the .sum method on an array.
it 'can stub one or more methods on a real object' do
  arr = [1, 2, 3]
  allow(arr).to receive(:sum).and_return(10)
  expect(arr.sum).to eq(10)

  The other array methods have not been over-written. All of the other methods will continue to act normally
  arr.push(4)
  expect(arr).to eq([1, 2, 3, 4])
  expect(arr.sum).to eq(10)
end

# If you expect a method to return different values each time it is called. Here we are mocking the behavior of an array [:b, :c]
# This is not the best example. It will typically used for very complicated behavior.
it 'can return multiple return values in sequence' do
  mock_array = double
  allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
  expect(mock_array.pop).to eq(:c)
  expect(mock_array.pop).to eq(:b)
  expect(mock_array.pop).to be_nil
  expect(mock_array.pop).to be_nil
end

# RIGHT HERE
# We are going to stubbing/mocking (emulating) the behavior of [1, 2, 3].
# Re-write this with letters, because it is confusing to have 1 arg and return 1.
it 'can return different values depending on the argument' do
  three_element_array = double

  allow(three_element_array).to receive(:first).with(no_args).and_return('a')
  allow(three_element_array).to receive(:first).with(1).and_return('a')
  allow(three_element_array).to receive(:first).with(2).and_return(['a', 'b'])
  allow(three_element_array).to receive(:first).with(be >= 3).and_return(['a', 'b', 'c'])

  expect(three_element_array.first).to eq('a')
  expect(three_element_array.first(1)).to eq('a')
  expect(three_element_array.first(2)).to eq(['a', 'b'])
  expect(three_element_array.first(3)).to eq(['a', 'b', 'c'])
  expect(three_element_array.first(100)).to eq(['a', 'b', 'c'])
end

# Using instance double gives the tests more security, and is preferred over regular doubles when possible.
The first argument has to be the class that you want to make a double of.
rspec will give you an error if you pass in the wrong number of arguments then defined in class.
We are not making a mock of the person class, we are making a mock of an instance of ther person class.
person = instance_double(Person)
allow(person).to receive(:a).with(3).and_return('Hello')
expect(person.a(3)).to eq('Hello')


# Many people use mock, spies and doubles interchangeably, but they are all slightly different.
Double => Pattern: Create Double, Give it a message, Expect that double to receive that message, before we invoke the method that would send the message to the double. So the expectation was before the action.

Spies are ultimate type of test double. They follow a slightly different pattern. We assert a message has been received after the action. So, the expectation is after the action. Spies automatically 'observe' all the messages that are sent to an object, even if we have not explicitly defined that message.
When you use a spy, instead of using 'receive' you use 'have_received'

let(:animal) { spy('animal') }
animal.eat_food
expect(animal).to have_received(:eat_food)
expect(animal).not_to have_received(:eat_human)
expect(animal).to have_received(:eat_food).at_least(2).times

RSpec.describe Garage do
  let(:car) { instance_double(Car) }

# This mocks a class method. This intercepts this message and creates the car instance double.
This also gives us spy-like functionality in our example.
Our test is going to be on the Garage class. All of the dependencies on the Car class need to be faked. There are 2 dependencies in this example.
We are invoking the new method on the class itself and we also need to fake what car returns. So, we need to fake the Car class and the Car instance.

before do
  allow(Car).to receive(:new).and_return(car)
end

it 'adds a car to its storage' do
  subject.add_to_collection('Honda Civic')
  expect(Car).to have_received(:new).with('Honda Civic')
  expect(subject.storage.length).to eq(1)
  expect(subject.storage.first).to eq(car)
end



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
