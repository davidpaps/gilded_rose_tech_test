# Gilded Rose Refactoring Kata

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). 

## How to use this Kata

The idea of the exercise is to do some deliberate practice, and improve your skills at designing test cases and refactoring. The idea is not to re-write the code from scratch, but rather to practice designing tests, taking small steps, running the tests often, and incrementally improving the design. 

## Text-Based Approval Testing

This is a testing approach which is very useful when refactoring legacy code. Before you change the code, you run it, and gather the output of the code as a plain text file. You review the text, and if it correctly describes the behaviour as you understand it, you can "approve" it, and save it as a "Golden Master". Then after you change the code, you run it again, and compare the new output against the Golden Master. Any differences, and the test fails.

It's basically the same idea as "assertEquals(expected, actual)" in a unit test, except the text you are comparing is typically much longer, and the "expected" value is saved from actual output, rather than being defined in advance.

Typically a piece of legacy code may not produce suitable textual output from the start, so you may need to modify it before you can write your first text-based approval test. That could involve inserting log statements into the code, or just writing a "main" method that executes the code and prints out what the result is afterwards. It's this latter approach we are using here to test GildedRose.

The Text-Based tests in this repository are designed to be used with the tool "TextTest" (http://texttest.org). This tool helps you to organize and run text-based tests. There is more information in the README file in the "texttests" subdirectory.

