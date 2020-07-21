## 1_string_spec
let variables\
let variables can change\
subject/let variables resets between each example\
put conditional information in the 'context' string

## 2_array_spec
implicitly defined 'subject'\
note on explicit 'subject'\
one-lines syntax\
predicate matchers

## 3_number_spec
explicit 'subject'\
comparison matchers\
instance_variable_set\
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
all matcher\
contain_exactly matcher\
start_with\
end_with\
more compound examples

## 8_change_matcher
using .or with compound expectations\
change matcher (syntax can be too tightly coupled to the subject)

## 9_custom_matcher
custom matcher

## 10_drinks_spec
default parameters\
instance_variable_set\
magic_matchers\
described class

## 11_shared_example with pets
shared examples\
have_attributes\
respond_to

## 12_magic_seven
Arrange, Act & Assert testing pattern

## 13_input_output
Important to write small, isolated methods to test\
Unnecessary to test puts and gets\
Use 'gets methods' as parameters in another method that is tested\
stubbing a method\
output matcher

## 14_find_number
TDD with doubles\
before hooks\
Add method names to: subject { described_class.new.game_solution }

## 15_binary_search
Changing TDD Double to Instance Double\
Stubbing a method\
Polymorphism concept

## 16_caesar_breaker
modules\
mocking - assert before act\
not_to raise_error\
testing rescued error

# Not Going to Cover
be_within matcher\
cover matcher\
throw_symbol matcher\
yield matcher\
shared_context\
custom error message - expect(card.suit).to eq(comparison), Expected #{comparison}, not #{card.suit}."\
spies