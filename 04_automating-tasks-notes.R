# Automating Tasks
# ================
# 
# Conditional Expressions
# -----------------------
# 
# Sometimes you'll need code to do different things, depending on a condition.
# _If-statements_ provide a way to write conditional code.
# 
# For example, suppose we want to greet one person differently from the others:


# Indent code inside of the if-statement by 2 or 4 spaces. Indentation makes
# your code easier to read.
# 
# The condition in an if-statement has to be a scalar:


# You can chain together if-statements:


# If-statements return the value of the last expression in the evaluated block:


# Curly braces `{ }` are optional for single-line expressions:


# But you have to be careful if you don't use them:


# The `else` block is optional:


# When there's no `else` block, the value of the `else` block is `NULL`:


# Functions
# ---------
# 
# The main way to interact with R is by calling functions.
# 
# You can also write your own functions.
# 
# To start, let's briefly review what functions are.
#
#
#
# Almost every command in R is a function, even the arithmetic operators and
# the parentheses!


# You can view the body of a function by typing its name without trailing
# parentheses.
#
# The body of a function is usually enclosed by curly braces `{}`.
#
# They're optional if the body only contains one line of code.
#
# Indenting code inside of curly braces by 2-4 spaces also helps make it
# visually distinct from other code.
# 
# For example:


# Many of R's built-in functions are not entirely written in R code.
#
# You can spot these by calls to the special `.Primitive` or `.Internal`
# functions in their code.
# 
# For instance:


# The `function` keyword creates a new function. Here's the syntax:
# 
#     function(parameter1, parameter2, ...) {
#       # Your code goes here
#     
#       # The result goes here
#     }
# 
# A function can have any number of parameters, and will automatically return
# the value of the last line of its body.
# 
# A function is a value, and like any other value.
#
# If you want to reuse it, you need to assign it to variable. Choose a
# descriptive name!
#
# It often makes sense to use verbs in function names.
# 
# Let's write a function that gets the largest values in a vector:


# And test it:


# The parameters inside the function do not exist as variables outside of the
# function:


# R keeps parameters and variables you define inside of a function
# separate from variables you define outside of a function.
# 
# `get_largest` would be more convenient if the parameter `n` was optional.
#
# You can make the parameter `n` optional by setting a _default argument_.
#
# Use `=` to assign default arguments to parameters:


# Test it again:


# ### Returning Values
# 
# A function will automatically return the value of its last line.
# 
# The `return` keyword returns a result and exits the function immediately.
#
# Only makes sense to use `return` from inside of an if-statement!
# 
# For example, to make `get_largest` return `NULL` if the argument for `vec` is
# a list:


# It's idiomatic to only use `return` when strictly necessary.
#
#
# A function returns one R object, but sometimes computations have multiple
# results.
#
# In that case, return the results in a vector, list, or other data structure.
# 
# For example, let's make a function that computes the mean and median for a
# vector:


# ### Planning Your Functions
# 
# Before you write a function, it's useful to go through several steps:
# 
# 1. Write down what you want to do, in detail. It can also help to
#    draw a picture of what needs to happen.
# 
# 2. Check whether there's already a built-in function. Search online and in the
#    R documentation.
# 
# 3. Write the code to handle a simple case first. For data science
#    problems, use a small dataset at this step.
# 
# Let's apply this in one final example: a function that detects leap years. A
# year is a leap year if either of these conditions is true:
# 
# * It is divisible by 4 and not 100
# * It is divisible by 400
# 
# That means the years 2004 and 2000 are leap years, but the year 2200 is not.
#
# So:


# Functions are the building blocks for solving larger problems.
#
# Take a divide-and-conquer approach, breaking large problems into smaller
# steps. Use a short function for each step.
#
# This approach makes it easier to:
# 
# * Test that each step works correctly.
# * Modify, reuse, or repurpose a step.
# 
# 
# Loops
# -----
# 
# One major benefit of using a programming language like R is that repetitive
# tasks can be automated. Already seen two ways to do this:
# 
# 1. Vectorization
# 2. Apply functions
# 
# Both _iterate_ over some object, and compute something for each element.
#
# Each one of these computations is one _iteration_.
#
# Vectorization is the most efficient.
#
# Apply functions are more flexible.
# 
# A _loop_ is even more flexible.
#
# In R, there are two kinds of loops.
# 
# ### For-loops
# 
# A _for-loop_ runs a block of code once for each element of a vector or list.
# The `for` keyword creates a for-loop. Here's the syntax:
# 
#     for (I in DATA) {
#       # Your code goes here
#     }
# 
# The variable `I` is called the _induction variable_.
#
# At the beginning of each iteration, `I` is assigned the next element of the
# vector or list `DATA`.
#
# The loop iterates once for each element of `DATA`, unless you use a keyword
# to exit the loop early.
#
# As with if-statements and functions, the curly braces `{ }` are only required
# if the body contains multiple lines of code.
# 
# Loops do not automatically return a result. Anything you want to save must be
# assigned to a variable.
# 
# For example, let's make a loop that repeatedly adds a number to a running
# total and squares the new total:


# Use for-loops when some or all of the iterations depend on results from other
# iterations. If the iterations are not dependent, use one of:
# 
# 1. Vectorization (because it's faster)
# 2. Apply functions (because they're idiomatic)
# 
# In some cases, you can use vectorization even when the iterations are
# dependent.
#
# For example, you can use vectorization to compute the sum of the
# cubes of several numbers:


# ### While-loops
# 
# A _while-loop_ runs a block of code repeatedly as long as some condition is
# `TRUE`. The `while` keyword creates a while-loop. Here's the syntax:
# 
#     while (CONDITION) {
#       # Your code goes here
#     }
# 
# The `CONDITION` should be a scalar logical value or an expression that
# returns one.
#
# At the beginning of each iteration, `CONDITION` is checked, and the loop
# exits if it is `FALSE`.
#
# As always, the curly braces `{ }` are only required if the body contains
# multiple lines of code.
# 
# For example, suppose you want to add up numbers from 0 to 50, but stop as
# soon as the total is greater than 50:


# While-loops are a generalization of for-loops.
#
# Most useful when you don't know how many iterations will be necessary!
#
# For example, suppose you want to repeat a computation until the result falls
# within some range of values.
# 
# 
# ### Saving Multiple Results
# 
# Loops often produce a different result for each iteration. What if you want
# to save these results?
# 
# First, set up an index vector.
#
# The index vector should usually be congruent to the number of iterations or
# the input.
#
# The `seq_along` function returns a congruent index vector when passed a
# vector or list.
#
# For instance, let's make in index for the `numbers` vector:


# Then make the loop iterate over the index rather than the data:


# Next, set up an empty output vector or list. This should usually be congruent
# to the input, or one element longer (the extra element comes from the initial
# value).
#
# R has several functions for creating vectors.
#
# The functions `logical`, `integer`, `numeric`, `complex`, and `character` to
# create  empty vectors with a specific type and length:


# Let's create an empty numeric vector congruent to `numbers`:


# As with the input, you can use the induction variable and indexing to save
# the output for each iteration.
# 
# Creating a vector or list in advance to store something is called
# _preallocation_.
#
# Preallocation is extremely important for efficiency in loops. Avoid using `c`
# or `append` to build up the output bit by bit!
# 
# Finally, write the loop, making sure to get the input and save the output:


# ### Break & Next
# 
# The `break` keyword causes a loop to immediately exit. It only makes sense to
# use `break` inside of an if-statement.
# 
# For example, suppose we want to print each string in a vector, but stop at the
# first missing value:


# The `next` keyword causes a loop to immediately go to the next iteration. As
# with `break`, it only makes sense to use `next` inside of an if-statement.
# 
# Let's modify the previous example so that missing values are skipped, but
# don't cause printing to stop:


# These keywords work with both for-loops and while-loops.
# 
# ### Example: The Collatz Conjecture
# 
# The Collatz Conjecture is a conjecture in math that was introduced in 1937 by
# Lothar Collatz and remains unproven today, despite being relatively easy to
# explain. Here's a statement of the conjecture:
# 
# > Start from any positive integer. If the integer is even, divide by 2. If the
# > integer is odd, multiply by 3 and add 1.
# >
# > If the result is not 1, repeat using the result as the new starting value.
# >
# > The result will always reach 1 eventually, regardless of the starting value.
# 
# The sequences of numbers this process generates are called _Collatz
# sequences_.
#
# For instance, the Collatz sequence:
#
# * Starting from 2 is `2, 1`.
# * Starting from 12 is `12, 6, 3, 10, 5, 16, 8, 4, 2, 1`.
# 
# Let's use a while-loop to compute Collatz sequences:


# Planning for Iteration
# ----------------------
# 
# At first it may seem difficult to decide if and what kind of iteration to
# use. Start by thinking about whether you need to do something over and over.
#
# If you don't, then you probably don't need to use iteration.
#
# If you do, then try iteration strategies in this order:
# 
# 1. vectorization
# 2. apply functions
#     * Try an apply function if iterations are independent.
# 3. for/while-loops
#     * Try a for-loop if some iterations depend on others.
#     * Try a while-loop if the number of iterations is unknown.
# 4. recursion (which isn't covered here)
#     * Convenient for naturally recursive problems (like Fibonacci),
#       but often there are faster solutions.
# 
# 
# Start by writing the code for just one iteration. Make sure that code works;
# it's easy to test code for one iteration.
# 
# When you have one iteration working, then try using the code with an iteration
# strategy (you will have to make some small changes). If it doesn't work, try to
# figure out which iteration is causing the problem. One way to do this is to use
# `message` to print out information. Then try to write the code for the broken
# iteration, get that iteration working, and repeat this whole process.
# 
# 
# Exercises
# ---------
# 
# _These exercises are meant to challenge you, so they're quite difficult
# compared to the previous ones. Don't get disheartened, and if you're able to
# complete them, excellent work!_
# 
# 
# ### Exercise
# 
# Create a function `compute_day` which uses the [Doomsday algorithm][doomsday]
# to compute the day of week for any given date in the 1900s. The function's
# parameters should be `year`, `month`, and `day`. The function's return value
# should be a day of week, as a string (for example, `"Saturday"`).
# 
# _Hint: the modulo operator is `%%` in R._
# 
# [doomsday]: https://en.wikipedia.org/wiki/Doomsday_rule
