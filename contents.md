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

## 11_shared_example with pets
have_attributes\
magic_matchers\
respond_to

## 12_magic_seven
Arrange, Act & Assert testing pattern

## 13_input_output
Important to write small, isolated methods to test\
Unnecessary to test puts and gets\
Use 'gets methods' as parameters in another method that is tested\
output matcher

## 14_find_number
TDD with doubles\
Add method names to: subject { described_class.new.game_solution }

# CURRENT WORK IN PROGRESS FILE:

## 15_binary_search
Changing TDD Double to Instance Double\
Something that sleeps(3) to show test time saving (database lookup). Generally, when talking to any external system is problematic, then that’s a good indication that you’d want to use a stub to fake that call.\
Using instance double gives the tests more security, and is preferred over regular doubles when possible.
The first argument has to be the class that you want to make a double of.
rspec will give you an error if you pass in the wrong number of arguments then defined in class.
We are not making a mock of the person class, we are making a mock of an instance of the person class.

# FUTURE - CAN NOT COVER EVERYTHING!!!

## Polumorphism Concept:
The movie class shouldn't care if it is given an actual class object, but rather all it cares is that it is given an object that can respond to certain methods (polymorphism).
Show how doubles can respond to same method with different return values
we shouldn't worry about about kind of object is, but what is can respond to...
It doesn't matter if we are responding to HotChocolate, Coffee, or Milk
This is a great way to test different class types with the same methods.
This literally just tests in a method exists on a object.
expect(subject).to respond_to(:purchase).with(1).arguments

## Resources on Doubles to include in files:
https://martinfowler.com/bliki/TestDouble.html
https://www.tutorialspoint.com/rspec/rspec_test_doubles.htm
http://testing-for-beginners.rubymonstas.org/test_doubles.html
https://relishapp.com/rspec/rspec-mocks/v/3-2/docs/configuring-responses

## Review TOP resources to make sure that this material is consistent:
http://www.betterspecs.org/
Also, check to for consistent use of describe and context

## Review connect_four student projects to see if anything else should be covered:
game.instance_variable_set

# Not Going to Cover?
be_within matcher\
cover matcher\
throw_symbol matcher\
yield matcher\
output matcher\
shared_context\
raise-error matcher\
.not_to with errors\
custom error message - expect(card.suit).to eq(comparison), Expected #{comparison}, not #{card.suit}."\
before and after hooks\
spies