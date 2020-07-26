| Title | Author | Date |
| --- | --- | --- |
| Addition of RSpec Playground | `Rachel Moser` | July 2020 |

# Addition of RSpec Playground

## Summary

The purpose of the 'RSpec Playground' is to equip students with additional practice before doing TDD with Connect Four. In addition, I believe students do not understand several important concepts, such as: 
- Writing small and isolated methods.
- Using a testing pattern, such as 'Arrange Act, and Assert'.
- Correctly using an explicit subject.
- How to create different test conditions
- How to stub methods - either class methods or puts/gets (and that it can be unnecessary to test puts/gets).
- How to use doubles, verifying doubles, etc.

## Motivation

I recently went through the RSpec section and I really struggled to do TDD for the Connect Four project. I know that TOP's curriculum will not cover everything that one needs to know and I try to embrace this challenge. So, I did a lot of online research and found a lot of answers that were specific to using RSpec with a Rails project. It was hard to correlate the answers that I found to Ruby, and to know if the answers were pointing me in the right direction. 

Therefore, I looked at student solution's spec files to find Ruby RSpec examples. I wanted to find a good example of using doubles in a test, but after looking at multiple student's projects, it felt like finding a needle in a haystack. 

Finally, I decided to purchase an inexpensive Ruby/RSpec video tutorial on Udemy (by Boris Paskhaver). Overall, it was a terrible experience, however the tutorial had a github repo full of example tests. I found that these hands-on tests were the most helpful. A few of the examples that I am using in this playground were inspired by that tutorial, but have been completed changed.

It is hard to TDD a project, when you are unfamiliar with the tool that you need to use. The assignment to write tests for Tic Tac Toe specifically states `Try using mocks/doubles to isolate methods`, but if you look at student solutions it is hard to find any of them using mocks/doubles. I think students just focus on creating tests for their `critical methods` and move on. However, I believe it is important to make sure students understand using mocks/doubles before they attempt to TDD Connect Four. As I stated previously, it is hard to find a Connect Four student solution that is using mocks/doubles either. 

If students had additional practice using RSpec, specifically mocks and doubles, then we will see an increase of the number of student solutions for Tic Tac Toe and Connect Four that are using them. 

## Suggested implementation

When I first started working on this 'playground', I imagined that it would be an additional resource in the [Testing Your Ruby Code lesson](https://www.theodinproject.com/courses/ruby-programming/lessons/testing-your-ruby-code). However, after talking with other people struggling with writing tests, I think it should be an assignment after writing tests for Caesar Cipher and before Tic Tac Toe. 

In addition, I believe the Sandi Metz video should come before doing tests for Tic Tac Toe. I included a link in the last file because it is very useful to teach what methods should be tested. This 'playground' does not focus on what tests should be written, because the exercises are very simple and uses a minimal number of classes. 

## Drawbacks

The only drawback to adding this to the curriculum is that we may be answering more questions about these exercises. I have asked people to go through them to help me eliminate the confusing areas. However, learning testing, especially the use of doubles/stubs/mocks can be very confusing no matter how good.

I am confident that once these exercises are reviewed by an experienced RSpec user, that any confusion 

## Alternatives

I searched for an alternative and could not find an better option than the Udemy course that I completed. 

## Additional

Early on I had told a few people about this repo in the #ruby-testing channel. In addition, I have privately told a few students about it. At this time, I know that andrewjh271, aaron-contreras, tenacious-qi, Natty, msespos, and Pandenok have or are currently going through them.

This playground needs a thorough review by someone a lot more familiar with RSpec. Even though I have spent two months learning RSpec, I do not feel 100% confident in some of my explanations & I have 0 'real-world' experience.

## Status
- [x] Proposed
- [ ] Accepted
- [ ] Planned
- [ ] In progress - [Link to Project Board](https;//github.com)
- [ ] Validating
- [ ] Complete
