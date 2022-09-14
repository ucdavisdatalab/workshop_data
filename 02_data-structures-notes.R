# Data Structures
# ===============
#
# Vectors
# -------
# 
# A _vector_ is a collection of values.
# 
# For instance, each column in a data frame is a vector:


# Vectors are ordered and homogeneous.
# 
# Another example:


# R does not distinguish between vectors and _scalars_.
# 
# You can use `length` to check the length of an object:


# ### Creating Vectors
# 
# Use `c` to concatenate values:


# If the arguments have different data types, R will convert them to a common
# data type:


# The colon operator `:` creates sequences of integers:


# Beware that both endpoints are always included:


# Also see the `seq` function.
# 
# ### Indexing Vectors
# 
# Access elements of a vector with the _indexing operator_ `[` (also called the
# _square bracket operator_). The syntax is:
# 
#     VECTOR[INDEXES]
# 
# Here `INDEXES` is a vector of positions of elements you want to get or set.
# 
# For example:


# You can also assign elements:


# Indexing is extremely important!
# 
# ### Vectorization
# 
# What if you call a math function on a vector?


# The result is the same as:


# The first version is easier to type and computed faster!
# 
# A _vectorized_ function takes a vector argument and is applied
# element-by-element.
#
# Most functions in R are vectorized, especially math. Examples:


# Contrast these with functions that _aggregate_ values in their argument:


# A function can be vectorized across multiple arguments:


# The elements are paired up by position.
#
# The other arithmetic operators are also vectorized:


# ### Recycling
# 
# What happens in a vectorized function if the vectors have different lengths?
#
# Try it and see!


# Elements of the shorter vector are _recycled_.
#
# Here's what that looks like written down:


# If the length of the longer vector is not a multiple of the length of the
# shorter vector, R issues a warning, but still returns the result:


# Unintended recycling is a common source of bugs!
# 
# Recycling might seem strange, but it's also convenient:


# Data Types & Classes
# --------------------
# 
# Data can be categorized into different _types_.
#
# For instance, statisticians tend to think about numeric versus categorical:
# 
# * numeric
#     + continuous (real or complex numbers)
#     + discrete (integers)
# * categorical
#     + nominal (categories with no ordering)
#     + ordinal (categories with some ordering)
# 
# Other types of data are also possible.
#
# 
# In R, data objects are categorized in two different ways:
# 
# 1. The _type_: What is this object?
#
# 2. The _class_: What does this object do?
# 
# Class tends to be more important than type.
#
# The class of a vector is the same as the class of its elements:


# For most vectors, the class and the type are the same:


# The exception is numeric vectors:


# R assumes most numbers you enter in code are numeric:


# But there is an `integer` class:


# There are many built-in classes!
# 
# ### Lists
# 
# A _list_ is an ordered, _heterogeneous_ data structure.
#
# Most vectorized functions do not work with lists.
# 
# You can make a list with the `list` function:


# For ordinary lists, the type and the class are both `list`:


# Data frames are also lists:


# ### Implicit Coercion
# 
# R's types fall into a natural hierarchy of expressiveness:
# 
#     logical -> integer -> double -> complex -> character
#
# For example:


# The `c` function relies on implicit coercion:


# Use `as.` functions to explicitly coerce the other way:


# Some types exist outside of the type hierarchy!
#
# If you try to use these types where it doesn't make sense, R usually raises
# an error:


# If you try to use these types as elements of a vector, you get back a list
# instead:


# Understanding how implicit coercion works will help you avoid bugs and save
# time.
#
# For example, to count how many elements of a vector satisfy a condition:


# ### Matrices & Arrays
# 
# A _matrix_ is the two-dimensional analogue of a vector.
# 
# You can create a matrix from a vector with the `matrix` function:


# The class of a matrix is always `matrix`:


# The type matches the type of the elements:


# Use `%*%` to multiply  matrices with compatible dimensions:


# An _array_ is a further generalization of matrices to higher dimensions.
# 
# ### Factors
# 
# A feature is _categorical_ if it measures a qualitative category.
#
# R uses the class `factor` to represent categorical data.
#
# Which features in the earnings data should be categorical?


# Let's convert these columns to factors.
#
# Use the `factor` function to create a factor:


# Factors are printed differently than strings.
# 
# Categories of a factor are called _levels_.
#
# You can list the levels with the `levels` function:


# Factors remember all possible levels even if you take a subset:


# You can make a factor forget levels that aren't present with the `droplevels`
# function:


# Special Values
# --------------
# 
# ### Missing Values
# 
# The _missing value_ `NA` represents missing entries in a data set.
# 
# It's a chameleon: it can be a logical, integer, numeric, complex, or
# character value.


# It's also contagious:


# So you can't use `==` to check for missing values:


# Use the `is.na` function instead:


# Missing values set R apart from most other programming languages!
# 
#
# ### Infinity
# 
# The value `Inf` represents infinity:


# Use the `is.infinite` function to test whether a value is infinite:


# ### Not a Number
# 
# The value `NaN`, called _not a number_, represents a quantity that's undefined
# mathematically.
#
# For instance:


# You can use the `is.nan` function to test whether a value is `NaN`:


# ### Null
# 
# The value `NULL` represents a quantity that's undefined in R.
#
# `NULL` often indicates the absence of a result.
#
# For instance:


# Unlike the other special values, `NULL` has its own unique type and class:


# You can use the `is.null` function to test whether a value is `NULL`:


# Indexing
# --------
# 
# The way to get and set elements of a data structure is by _indexing_.
#
# Indexing is a fundamental operation in R!
# 
# The indexing operator `[` is R's primary operator for indexing.
#
# It works in four different ways:
# 
# 1. All elements, with no index
# 2. By position, with a numeric index
# 3. By name, with a character index
# 4. By condition, with a logical index
# 
#  Consider this vector:


# The indexing operator works with almost all data structures.
# 
# ### All Elements
# 
# An empty index selects all elements:


# Rarely used for getting elements.
#
# Main use is for setting elements:


# ### By Position
# 
# An integer or numeric index selects elements by position:


# Often used with `:`.
#
# For instance:


# Numbers can be repeated and the order matters:


# Negative indexes exclude elements:


# Index must be all positive or all negative.


# ### By Name
# 
# A character vector (string) index selects elements by name:


# Again, repeats are allowed and order matters:


# If names aren't unique, gets the first match:


# ### By Condition
# 
# A logical vector index selects elements by position.
#
# The target and index should be _congruent_.
#
# That is, have the same length and they correspond element-by-element.
#
# For example:


# Elements where the index is `TRUE` are kept and elements where the index is
# `FALSE` are dropped.
# 
# If you create the index from a condition on the object, it's automatically
# congruent:


# You can also use indexing by condition to set elements.
#
# For example:


# ### Logic
# 
# R provides operators to negate and combine logical vectors.
# 
# #### Negation {-}
# 
# The _NOT operator_ `!` converts `TRUE` to `FALSE` and `FALSE` to `TRUE`:


# You can use `!` with a condition:


# The NOT operator is vectorized:


# #### Combinations {-}
# 
# The _AND operator_ `&` returns `TRUE` only when both arguments are `TRUE`:



# The _OR operator_ `|` returns `TRUE` when at least one argument is `TRUE`:


# Be careful: everyday English is less precise than logic! You might say:
# 
# > I want all subjects over age 50 and all subjects that like cats.
# 
# But in logic this means:
# 
#     (subject age over 50) OR (subject likes cats)`
# 
# So think carefully!
#
#
# The _XOR (eXclusive OR) function_ `xor()` returns `TRUE` when exactly one
# argument is `TRUE`:


# The AND, OR, and XOR operators are vectorized.
# 
#
# #### Short-circuiting {-}
# 
# The second argument is irrelevant in some conditions:
# 
# * `FALSE &` is always `FALSE`
# * `TRUE |` is always `TRUE`
# 
# Now imagine you have `FALSE & long_computation()`.
#
# A _short-circuit_ skips `long_computation()` whenever possible. R has two:
# 
# * `&&` is a short-circuited `&`
# * `||` is a short-circuited `|`
# 
# These operators only evaluate the second argument if it is necessary to
# determine the result.
#
# Examples:


# The short-circuit operators are _not_ vectorized!
#
# So don't use them for indexing.
# 
#
# Exercises
# ---------
# 
# ### Exercise
# 
# The `rep` function is another way to create a vector. Read the help file for
# the `rep` function.
# 
# 1. What does the `rep` function do to create a vector? Give an example.
# 2. The `rep` function has parameters `times` and `each`. What does each do, and
#    how do they differ? Give examples for both.
# 3. Can you set both of `times` and `each` in a single call to `rep`? If the
#    function raises an error, explain what the error message means. If the
#    function returns a result, explain how the result corresponds to the
#    arguments you chose.



# ### Exercise
# 
# Considering how implicit coercion works (Section \@ref(implicit-coercion)):
# 
# 1. Why does `"3" + 4` raise an error?
# 2. Why does `"TRUE" == TRUE` return `TRUE`?
# 3. Why does `"FALSE" < TRUE` return TRUE?



# ### Exercise
# 
# 1. Section \@ref(missing-values) described the missing value as a "chameleon"
#    because it can have many different types. Is `Inf` also a chameleon? Use
#    examples to justify your answer.
# 
# 2. The missing value is also "contagious" because using it as an argument
#    usually produces another missing value. Is `Inf` contagious? Again, use
#    examples to justify your answer.



# ### Exercise
# 
# The `table` function is useful for counting all sorts of things, not just level
# frequencies for a factor. For instance, you can use `table` to count how many
# `TRUE` and `FALSE` values there are in a logical vector.
# 
# 1. For the earnings data, how many rows had median weekly earnings below \$750?
# 2. Based on how the data is structured, is your answer in part 1 the same as
#    the number of quarters that had median weekly earnings below \$750? Explain.



