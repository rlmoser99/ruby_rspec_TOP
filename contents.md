# Each file:
should introduce at least once new concept.\
should have an assignment to complete that covers any previous material.

## 1_string_spec
let variables\
let variables can change\
subject/let variables resets between each example\
put conditional information in the 'context' string

## 2_array_spec
implicitly defined 'subject'\
one-lines syntex\
predicate matchers

## 3_number_spec
comparison matchers\
.not_to instead of .to\
(assignment has 'include')

## 4_hash_spec
true/false\
include

## 5_truthy_falsy
truthy and falsy\
(no assignment)

## 6_equality_matchers
eq & eql & equal & be

## 7_all_contain_exactly
put objects in describe\
all matcher\
contain_exactly matcher\
start_with\
end_with\
more compound examples

## 8_change_matcher
using .or with compound expectations\
change matcher (syntex can be too tightly coupled to the subject)

## 9_satisfy_matcher
satisfy matcher\
custom error message for satisfy method

## 10_drinks_spec
default parameters\
described class

## 11_polymorphism

Similar Items - Pets => Cats & Dogs
Similar Attributes - name, breed, color
Similar Methods - feed, talk

Cat only - like_to_nap
Dog only - like_to_run

## Can not cover everything!!!

# FUTURE:

## have_attributes
https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do
expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner') }

## polymorphism - (many shapes)
shared_examples - one test, for different classes.
we shouldn't worry about about kind of object is, but what is can respond to...
It doesn't matter if we are responding to HotChocolate, Coffee, or Milk
This is a great way to test different class types with the same methods.
This literally just tests in a method exists on a object.
expect(subject).to respond_to(:purchase).with(1).arguments

## Test object methods in isolation, we can emulate the behavior of other objects.
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

## Stub -  We are going to stub the .sum method on an array.
https://www.tutorialspoint.com/rspec/rspec_stubs.htm
it 'can stub one or more methods on a real object' do
  arr = [1, 2, 3]
  allow(arr).to receive(:sum).and_return(10)
  expect(arr.sum).to eq(10)

  The other array methods have not been over-written. All of the other methods will continue to act normally
  arr.push(4)
  expect(arr).to eq([1, 2, 3, 4])
  expect(arr.sum).to eq(10)
end

## If you expect a method to return different values each time it is called. Here we are mocking the behavior of an array [:b, :c]
## This is not the best example. It will typically used for very complicated behavior.
it 'can return multiple return values in sequence' do
  mock_array = double
  allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
  expect(mock_array.pop).to eq(:c)
  expect(mock_array.pop).to eq(:b)
  expect(mock_array.pop).to be_nil
  expect(mock_array.pop).to be_nil
end

## We are going to stubbing/mocking (emulating) the behavior of [1, 2, 3].
## Re-write this with letters, because it is confusing to have 1 arg and return 1.
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

## Using instance double gives the tests more security, and is preferred over regular doubles when possible.
The first argument has to be the class that you want to make a double of.
rspec will give you an error if you pass in the wrong number of arguments then defined in class.
We are not making a mock of the person class, we are making a mock of an instance of ther person class.
person = instance_double(Person)
allow(person).to receive(:a).with(3).and_return('Hello')
expect(person.a(3)).to eq('Hello')


## Many people use mock, spies and doubles interchangeably, but they are all slightly different.
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

## This mocks a class method. This intercepts this message and creates the car instance double.
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

## Review TOP resources to make sure that this material is consistent:
http://www.betterspecs.org/

## Check out TOP student project. To see if there is something that I don't understand yet, like:
game.instance_variable_set

## Rspec & Rubocop Style Guide:

### Prefer instance doubles over stubbing any instance of a class
let(:my_instance) { instance_double(MyClass) }
allow(MyClass).to receive(:new).and_return(my_instance)
allow(my_instance).to receive(:foo)

let(:foo) do
  instance_double("ClassName", method_name: 'returned value')
end

### RSpec/DescribedClassModuleWrapping
RSpec.describe MyModule::MyClass do
  ...
end

### RSpec/InstanceSpy
foo = instance_spy(Foo)
expect(foo).to have_received(:bar)

# Not Going to Cover?
be_within matcher\
cover matcher\
exist matcher (link on truthy/falsy talks about it)\
throw_symbol matcher\
yield matcher\
output matcher\
shared_context\
raise-error matcher\
.not_to with errors\
custom error message - expect(card.suit).to eq(comparison), Expected #{comparison}, not #{card.suit}."\
before and after hooks\

# Resources to Share
Cheat Sheet\
https://kapeli.com/cheat_sheets/RSpec_Expectations.docset/Contents/Resources/Documents/index
