# RSpec Playground (no longer maintained)
This repository was a contribution to an open source web development curriculum called [The Odin Project](https://www.theodinproject.com/). It is included in this [lesson]https://www.theodinproject.com/courses/ruby-programming/lessons/testing-your-ruby-code and is maintained on their [github](https://github.com/TheOdinProject/ruby_testing).

## Purpose
The purpose of this repository is to provide 'hands-on' RSpec lessons. These lessons were designed to equip students to write tests for their Tic-Tac-Toe and to TDD their Connect Four.

## Topics
These lessons cover many topics, but it does not cover everything that RSpec is capable of testing. You should expect to learn foundational knowledge on the following topics:
- Let Variables
- Implicit and Explicit Subject
- A variety of built-in-matchers
- Setting values for instance variables to create test conditions
- The 'Arrange, Act & Assert' testing pattern
- Stubs, Mocks, and Doubles
- Test Driven Development

## Set-Up
To install RSpec, run `bundle install` from the root directory of this project.

## How to use this playground
These lessons are numbered 01 - 16, in the **spec** folder. Start with the file: <code>spec/01_string_spec.rb</code>. The first 9 lessons are self-contained in the spec file. Starting with lesson 10, there will be 1-3 corresponding files in the <code>lib</code> folder.

If you get stuck on a lesson, there is a corresponding answer file located in the <code>spec_answer</code> folder.

## Running Tests
Since this repository is full of tests, it is recommended to only run <code>rspec</code> on one individual file at at time. For example, to run the first test file from the root of this directory:

<pre><code>rspec spec/01_string_spec.rb</code></pre>

Tip: If you have tab completion set-up, you can hit 'tab' after the first few characters of the file name.
