# RSpec Playground
The purpose of this repository is to provide 'hands-on' examples of tests. This playground covers many topics, but it does not cover everything that RSpec is capable of testing. 

## Topics
These lessons build foundational knowledge on the following topics:
- Let Variables
- Implicit and Explicit Subject
- Setting values for instance variables to create test conditions
- The 'Arrange, Act & Assert' testing pattern
- Stubs, Mocks, and Doubles
- Test Driven Development

## Prerequisite
You will need [rspec](https://rspec.info/) installed on your computer. 

## Start
The lessons are numbered 01 - 16, in the **spec** folder. The answers are available in the spec_answer folder. Beginning with lesson 10, there are file(s) in the lib folder. 

Start with the file: <code>spec/01_string_spec.rb</code>

## Running Tests
Since this repository is full of tests, it is recommended to only run rspec tests on one individual file at at time. For example, to run the first test file from the root of this directory:

<pre><code>rspec spec/01_string_spec.rb</code></pre>

Tip: If you have tab completion set-up, you can hit 'tab' after the first few characters of the file name.

## Set-Up
This repository already has rspec initialized & has the following line added to the .rspec file to output a more colorful and verbose test.

<pre><code>--format documentation</code></pre>
