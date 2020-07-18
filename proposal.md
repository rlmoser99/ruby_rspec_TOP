| Title | Author | Date |
| --- | --- | --- |
| Title of proposal | `Rachel Moser` | July 2020 |

# PROPOSAL NAME

## Summary

To equip students with additional RSpec practice before doing TDD with Connect Four. Currently, I believe students do not understand several concepts, such as: 
- Writing small and isolated methods.
- Using a testing pattern, such as 'Arrange Act, and Assert'.
- Correctly using an explicit subject.
- Methods that only use puts and/or gets can be unnecessary to test.
- How and when to use stubs, doubles, verifying doubles, etc.

(Brief explanation of the proposal.)

## Motivation

I recently went through the RSpec section and I really struggled to do TDD for the Connect Four project. I know that TOP's curriculum will not cover everything that one needs to know and I try to embrace this challenge. So, I did a lot of online research and found a lot of answers that were specific to using RSpec with a Rails project. It was hard to correlate the answers that I found to Ruby, and to know if the answers were pointing me in the right direction. 

Therefore, I looked at student solution's spec files to find Ruby RSpec examples. I wanted to find a good example of using stubs or doubles in a test, but after looking at several files, it felt like finding a needle in a haystack. 

Finally, I decided to spend a few dollars on a Ruby/RSpec video tutorial on Udemy (by Boris Paskhaver). Overall, it was a terrible experience, however the tutorial had a github repo full of example tests. I found these hands-on tests to be very helpful. A few of the examples that I am using in this playground were inspired by that tutorial, but have been completed changed.

It is hard to TDD a project, when you are unfamiliar with the tool that you need to use. The assignment to write tests for Tic Tac Toe specifically states `Try using mocks/doubles to isolate method`, but if you look at student solutions it is hard to find any of them using mocks/doubles. I think students just focus on creating tests for their `critical methods` and move on. However, I believe it is important to make sure students understand using mocks/doubles before they attempt to TDD Connect Four. As I stated previously, it is hard to find a Connect Four student solution that is using mocks/doubles either. 

If students had additional practice using RSpec, specifically mocks and doubles, then we will see an increase of the number of student solutions for Tic Tac Toe and Connect Four that are using them. 

(Explain the motivation behind this proposal. What is the purpose of this change or implementation? What does it solve? What is the expected outcome of this proposal?)

(Make sure to express the motivation of this proposal in the best way you can so that if the change or implementation that is suggested here is not accepted, this motivation can be used to come up with an alternative solution.)

## Suggested implementation

When I first started working on this 'playground', I imagined that it would be an additional resource in the [Testing Your Ruby Code lesson](https://www.theodinproject.com/courses/ruby-programming/lessons/testing-your-ruby-code). However, it could be beneficial as an assignment after writing tests for Caesar Cipher and before Tic Tac Toe. 

(Suggested implementation for the proposal, how will this be implemented? if you like, include examples or diagrams that can help explain. If it is a change in flow or management, specify what it should be changed to and how will that look. This doesn't have to be detailed implementation although it is encouraged but at the very least you as the author of the proposal should have an implementation idea in mind.)

## Drawbacks

(Are there any drawbacks to this proposal? consider the following:)

- Complexities or time consuming.
- Amount of people needed to develop or availability of your own time.
- Impact of the current state.
- Will users need to change their flow? in what way?

## Alternatives

(Are there any alternative implementations to this? What else can be done?)

## Additional

Earlier in the Ruby curriculum, we learn that we can make any method private that is not accessed outside of the class. 

However, what should happen when there is a private method that is also critical to the project?

 I know that there is ways to test private methods, but this point is not very clear at this point in the curriculum.

One 'unanswered' question that I have is how to find the balance between making methods that are not accessed outside of the class to be private and to test all critical methods.


(This can be any unanswered questions, things that still need to considered or solved about the implentation, any reference links to the initial ideation such as a [Discourse Forum](https://forum.theodinproject.com/c/sprints), discussions or anything else.)

## Status
- [x] Proposed
- [ ] Accepted
- [ ] Planned
- [ ] In progress - [Link to Project Board](https;//github.com)
- [ ] Validating
- [ ] Complete
