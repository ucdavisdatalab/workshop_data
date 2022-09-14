# Getting Started
# ===============
#
# ### The Working Directory
# 
# The _working directory_ is the starting point R uses for relative paths.
# 
# The function `getwd` returns the current working directory:


# The related `setwd` function changes the working directory. It takes one
# argument: a path to the new working directory.


# Avoid calls to `setwd` in R scripts and R Markdown files!
#
# Use relative paths instead!
# 
# The `list.files` function returns the names of all of the files and
# directories inside of a directory.


# If you call `list.files` with an invalid path or an empty directory, the
# output is `character(0)`.


# Reading Files
# -------------
#
# ### Hello, Data!
# 
# Let's read our first data set!
#
# The data set is a file called `earn.csv`.


# Data Frames
# -----------
# 
# Now that we've loaded the data, let's take a look at it.
#
# You can use the `head` function to print only the beginning of a data set:


# This is a data frame.
# 
# When you first read an object into R, you might not know whether it's a data
# frame.
#
# The `class` function returns information about what an object is:


# The `ncol` function returns the number of columns:


# The `nrow` function returns the number of rows:


# The `dim` function returns both:


# The `names` and `colnames` functions both return the column names:


# If the rows have names, you can get those with the `rownames` function.


# ### Summarizing Data
# 
# R provides two different functions to get summaries: `str` and `summary`.
# 
# The `str` function returns a _structural summary_ of an object.


# The `summary` function returns a _statistical summary_ of an object.


# ### Selecting Columns
# 
# The `$` dollar sign operator selects columns in a data frame. The syntax is:
# 
#     VARIABLE$COLUMN_NAME
# 
# For instance:


# So to compute the mean of the `n_persons` column:


# And to compute the range of the `year` column:


# You can also use the `$` dollar sign operator to assign values to columns.
#
# For instance, to assign `0` to the entire `quarter` column:


# Be careful, there's no undo!
#
# But you can reset `earn` by reloading the data set:


# Exercises
# ---------
# 
# ### Exercise
# 
# In a string, an _escape sequence_ or _escape code_ consists of a backslash
# followed by one or more characters. Escape sequences make it possible to:
# 
# * Write quotes or backslashes within a string
# * Write characters that don't appear on your keyboard (for example, characters
#   in a foreign language)
# 
# For example, the escape sequence `\n` corresponds to the newline character.
# There's a complete list of escape sequences for R in the `?Quotes` help file.
# Other programming languages also use escape sequences, and many of them are the
# same as in R.
# 
# 1. Assign a string that contains a newline to the variable `newline`. Then make
#    R display the value of the variable by entering `newline` at the R prompt.
# 2. The `message` function prints output to the R console, so it's one way you
#    can make your R code report information as it runs. Use the `message`
#    function to print `newline`.
# 3. How does the output from part 1 compare to the output from part 2? Why do
#    you think they differ?



# ### Exercise
# 
# 1. Choose a directory on your computer that you're familiar with, such as one
#    you created. Determine the path to the directory, then use `list.files` to
#    display its contents. Do the files displayed match what you see in your
#    system's file browser?
# 
# 2. What does the `all.files` parameter of `list.files` do? Give an example.




# ### Exercise
# 
# The `read.table` function is another function for reading tabular data. Take a
# look at the help file for `read.table`. Recall that `read.csv` reads tabular
# data where the values are separated by commas, and `read.delim` reads tabular
# data where the values are separated by tabs.
# 
# 1. What value-separator does `read.table` expect by default?
# 2. Is it possible to use `read.table` to read a CSV? Explain. If your answer is
#    yes, show how to use `read.table` to load the employee earnings data from
#    Section \@ref(hello-data).



