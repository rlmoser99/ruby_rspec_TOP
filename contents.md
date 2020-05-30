x - let variables
x - default parameters - test without & with parameter
x - parameters of variables that can change

subject in describe
subject { described_class.new } to ensure for future class name changes

one-lines syntex

predicate methods in expect() or be_matcher

before example / context ( and after example / context)

shared_examples (polymorphism)
shared_context ?

.not_to
.be < or >
.to all(criteria)

.eq vs. .eql vs. .equal vs .be
truthy and falsey

change matcher
expect(subject).to contain_exactly(1, 2, 3)
expect(subject).to start_with(:a, :b, :c)
expect(subject).to end_with(:d)

expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin') }

expect(subject).to include('late')
it { is_expected.to include('choc') }

custom error messages & can check for a specific error being raised

expect(subject).to respond_to(:drink, :discard, :purchase)
expect(subject).to respond_to(:purchase).with(1).arguments

-at satisfy

stubs double - use when an object is needed to provide something that takes time (database call)

http://testing-for-beginners.rubymonstas.org/test_doubles.html

what is:
game.instance_variable_set
expect(STDOUT).to receive(:puts).at_least(:twice)
expect(game.intro).not_to raise_error
expect(my_game.check_input(5)).to satisfy { |num| num.between?(1, 7) }
expect { board.display_to_screen }.to output(/\|1\|2\|3\|4\|5\|6\|7\|/).to_stdout

it "prompts player 1 first" do
    player = 1
    newgame1.take_turn(player)
    allow($stdin).to receive(:gets).and_return(1)
    play = $stdin.gets
    
    expect(play).to eql(1)
end