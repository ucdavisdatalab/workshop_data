# Exploring Data
# ==============
# 
# Indexing Data Frames
# --------------------
# 
# Remember: every data frame is a list!
# 
# ### Indexing Lists
# 
# Lists are a _container_ for other types.
#
# When you index, you can either keep the container (the list) or discard
# it.
#
# The indexing operator `[` almost always keeps the container:


# The result is still a list.
#
# Unlike the indexing operator `[`, the extraction operator `[[` always
# discards the container:


# The tradeoff: the extraction operator can only get or set one element at
# a time.
#
# The "element" can be a vector!
#
# The extraction operator can only index by position or name:


# The index operator `[` returns `NA` for invalid vector elements, and `NULL`
# for invalid list elements:


# The extraction operator `[[` raises an error for invalid elements:


# In general:
#
# * Use the indexing operator `[` to index vectors
# * Use the extraction operator `[[` to index containers.
# 
# 
# ### Two-dimensional Indexing
# 
# For two-dimensional objects, pass `[` or `[[` two indexes.
#
# The rows come first:
# 
#   DATA[ROWS, COLUMNS]
# 
# For instance:


# Mixing different ways of indexing is allowed:


# For data frames, it's especially common to index rows by condition and
# columns by name.
#
# For example:


# ### The `drop` Parameter
# 
# If you use two-dimensional indexing with `[` to select exactly one column,
# you get a vector:


# The container is dropped, even though `[` usually keeps containers!
#
# This also occurs for matrices.
#
# You can control this behavior with the `drop` parameter:


# The default is `drop = TRUE`.
# 
# 
# Packages
# --------
# 
# A _package_ is a collection of functions for use in R.
#
# Packages usually include documentation, and can also contain examples,
# vignettes, and data sets.
#
# The Comprehensive R Archive Network (CRAN) is the main place people
# publish packages. As of writing, there were 18,619 packages!
# 
# The `install.packages` function installs one or more packages from CRAN. Its
# first argument is the packages to install, as a character vector.
# 
# When you run `install.packages`, R will ask you to choose which _mirror_ to
# download the package from.
#
# If you aren't sure, use the 0-Cloud mirror.
# 
# For example, to install the `remotes` package:


# R automatically installs any other packages the requested package depends on.
#
# You can tell that installation succeeded by the final line `DONE`.
#
# When installation fails, R prints an error message instead.
# 
# You only need to install each package once, but you can reinstall a package
# with `install.packages` to update to the latest version.
# 
# Alternatively, all packages with the `update.packages` function. Beware, this
# may take a long time!
# 
# The function to remove packages is `remove.packages`.
# 
# You can use the `installed.packages` function to see which packages are
# installed:


# Before you can use an installed package, you must load the package with the
# `library` function.
#
# R doesn't load packages automatically because each package you load uses
# memory and may conflict with other packages.
#
# Only load the packages you need for what you want to do.
#
# When you restart R, the loaded packages are cleared.
# 
# Load the remotes package we installed earlier:


# The `library` function works with or without quotes around the package name!
#
# New or experimental packages are often published on GitHub rather than CRAN.
# The remotes package provides functions to install packages from GitHub.
#
# It's generally better to install packages from CRAN when possible.
# 
#
# Data Visualization
# ------------------
# 
# There are three popular systems for creating visualizations in R:
# 
# 1. The base R functions (primarily the `plot` function)
# 2. The lattice package
# 3. The ggplot2 package
# 
# These are not interoperable!
#
# Choose one and stick to it.
#
# Compared to base R, both lattice and ggplot2:
#
# * Are better at handling grouped data
# * Require less code to create a nice-looking plot
# 
# The ggplot2 package is the most popular, and is part of the Tidyverse, a
# collection of data analysis packages designed to work well together. It also
# has detailed documentation and a cheatsheet.
#
# So we'll use ggplot2.
#
# The "gg" in ggplot2 stands for _grammar of graphics_.
#
# The idea is that visualizations can be built up in layers.
#
# Three layers every plot must have are:
# 
# * Data
# * Geometry
# * Aesthetics
# 
# There are also several optional layers. Here are a few:
# 
# Layer       | Description
# ----------  | -----------
# scales      | Title, label, and axis value settings
# facets      | Side-by-side plots
# guides      | Axis and legend position settings
# annotations | Shapes that are not mapped to data
# coordinates | Coordinate systems (Cartesian, logarithmic, polar)
# 
# 
# Let's plot the earnings data. First, install and load ggplot2:


# What kind of plot should we make?
#
#
#
#
# Let's make a line plot that shows median earnings for each quarter in 2019,
# with separate lines for men and women.
# 
# Before plotting, take a subset of the earnings that only contains data for
# 2019:


# The data is also broken down across `race`, `ethnic_origin`, and `age`.
#
# We aren't interested in these categories, so need to further
# subset the data:


# Now we're ready to make the plot.
# 
# ### Layer 1: Data
# 
# The data layer determines the data set used to make the plot.
#
# ggplot2 and most other Tidyverse packages are designed for working with
# _tidy_ data frames.
#
# Tidy means:
# 
# 1. Each observation has its own row.
# 2. Each feature has its own column.
# 3. Each value has its own cell.
# 
# Tidy data sets are convenient!
# 
# To set up the data layer, call the `ggplot` function on a data frame:


# This returns a blank plot. We still need to add a few more layers.
# 
# 
# ### Layer 2: Geometry
# 
# The **geom**etry layer determines the shape or appearance of the visual
# elements of the plot.
#
# There are many different geometries available. The package provides
# a function for each geometry, always prefixed with `geom_`.
# 
# Use `+` to add a geometry layer to the plot:


# This returns an error message that we're missing aesthetics `x` and `y`.
#
# When you use a geometry you're unfamiliar with, it can be helpful to run the
# code like this just to see the required aesthetics.
# 
# It's possible to add multiple geometries to a plot.
# 
# 
# ### Layer 3: Aesthetics
# 
# The **aes**thetic layer determines the relationship between the data and the
# geometry.
#
# Use the aesthetic layer to map features in the data to **aesthetics** (visual
# elements) of the geometry.
# 
# The `aes` function creates an aesthetic layer. The syntax is:
#
#     aes(AESTHETIC = FEATURE, ...)
#
# The names of the aesthetics depend on the geometry.
#
# For example, we want to put `quarter` on the x-axis and `median_weekly_earn`
# on the y-axis.
#
# Also want to use a separate line style for each `sex` category.
#
# So:


# In the `aes` function, column names are never quoted.
# 
# The aesthetic layer is not added to the plot with `+`.
#
# Instead, pass the aesthetic layer as the 2nd argument to `ggplot`:


# If you want to set an aesthetic to a constant value, do so *outside* of the
# aesthetic layer.
#
# For instance, to make the lines blue:


# If you set an aesthetic to a constant value inside of the aesthetic layer:


# ### Layer 4: Scales
# 
# The scales layer controls the title, axis labels, and axis scales of the
# plot.
#
# Most of the functions in the scales layer are prefixed with `scale_`.
# 
# The `labs` function sets the title and axis labels:


# ### Saving Plots
# 
# Use the `ggsave` function to save the most recent plot you created:


# The file format is selected automatically based on the extension. Common
# formats are PNG and PDF.
#
# This only works for ggplot2 plots!
#
#
# #### The Plot Device {-}
# 
# You can also save a plot with one of R's "plot device" functions. The steps
# are:
# 
# 1. Call a plot device function: `png`, `jpeg`, `pdf`, `bmp`, `tiff`, or `svg`.
# 2. Run your code to make the plot.
# 3. Call `dev.off` to indicate that you're done plotting.
# 
# This strategy works with any of R's graphics systems (not just ggplot2).
# 
# Here's an example:


# ### Example: Bar Plot
# 
# Let's say we want to plot the number of persons for each sex, again using the
# earnings data set.
#
# A bar plot is an appropriate way to represent this visually.
# 
# The geometry for a bar plot is `geom_bar`.
#
# By default, `geom_bar` automatically computes frequencies for the `y`
# aesthetic.
# 
# `n_persons` is not categorical, so we don't need `geom_bar` to
# compute frequencies. So set `stat = "identity"`.
# 
# Here's the code:


# The setting `position = "dodge"` instructs `geom_bar` to put the bars
# side-by-side rather than stacking them.
# 
# 
# ### Visualization Design
# 
# Designing high-quality visualizations goes beyond just mastering which R
# functions to call. You also need to think carefully about what kind of data
# you have and what message you want to convey. This section provides a few
# guidelines.
# 
# The first step in data visualization is choosing an appropriate kind of plot.
# Here are some suggestions (not rules):
# 
# | Feature 1   | Feature 2   | Plot
# | :---------- |:----------- |:----
# | categorical |             | bar, dot
# | categorical | categorical | bar, dot, mosaic
# | numerical   |             | box, density, histogram
# | numerical   | categorical | box, density, ridge
# | numerical   | numerical   | line, scatter, smooth scatter
# 
# If you want to add a:
# 
# * 3rd numerical feature, use it to change point/line sizes.
# * 3rd categorical feature, use it to change point/line styles.
# * 4th categorical feature, use side-by-side plots.
# 
# Once you've selected a plot, here are some rules you should almost always
# follow:
# 
# * Always add a title and axis labels. These should be in plain English, not
#   variable names!
# 
# * Specify units after the axis label if the axis has units. For instance,
#   "Height (ft)".
# 
# * Don't forget that many people are colorblind! Also, plots are often printed
#   in black and white. Use point and line styles to distinguish groups; color is
#   optional.
# 
# * Add a legend whenever you've used more than one point or line style.
# 
# * Always write a few sentences explaining what the plot reveals. Don't
#   describe the plot, because the reader can just look at it. Instead,
#   explain what they can learn from the plot and point out important details
#   that are easily overlooked.
# 
# * Sometimes points get plotted on top of each other. This is called
#   _overplotting_. Plots with a lot of overplotting can be hard to read and can
#   even misrepresent the data by hiding how many points are present. Use a
#   two-dimensional density plot or jitter the points to deal with overplotting.
# 
# * For side-by-side plots, use the same axis scales for both plots so that
#   comparing them is not deceptive.
# 
# Visualization design is a deep topic, and whole books have been written about
# it. One resource where you can learn more is DataLab's [Principles of Data
# Visualization Workshop Reader][dataviz].
# 
# [dataviz]: https://ucdavisdatalab.github.io/workshop_data_viz_principles/
#
#
# Apply Functions
# ---------------
# 
# Vectorization is concise and efficient, but not all functions are vectorized.
# 
# For example, the `class` function:


# What if you want to get the class of each column in a data frame?
#
# Can get the class for a single column by selecting the column with `$`:


# But what if we want the classes for all the columns?
#
# Could write a call to `class` for each column, but that's tedious. There's
# usually a better, more automated way.
# 
# Data frames are lists.
#
# So we need a line of code that calls `class` on each element of the list.
#
# The `lapply` function calls, or _applies_, a function on each element of a
# list or vector. The syntax is:
# 
#     lapply(X, FUN, ...)
# 
# The function `FUN` is called once for each element of `X`, with the element as
# the first argument.
#
# The `...` is for additional arguments to `FUN`, which are held constant
# across all the elements.
# 
# Let's try this out with the earnings data and the `class` function:


# The result is similar to if the `class` function was vectorized.
#
# In fact, if we use a vector and a vectorized function with `lapply`, the
# result is nearly identical to the result from vectorization:


# The only difference is that the result from `lapply` is a list.
#
# The `lapply` function always returns a list. The "l" in `lapply` stands for
# "list".
# 
# The `lapply` function is one member of a family of functions called _apply
# functions_.
# 
# When you have a choice between using vectorization or an apply function,
# always choose vectorization!
#
# ### The `sapply` Function
# 
# The related `sapply` function calls a function on each element of a list or
# vector, and simplifies the result.
#
# The "s" in `sapply` stands for "simplify".
# 
# For instance, try using `sapply` to find the classes of the columns in the
# earnings data:


# Try using `sapply` to compute `sin` values:


# Vectorization is still more efficient than `sapply`, so use vectorization
# instead when possible.
# 
# Apply functions are very useful for summarizing data!
#
# For example, suppose we want to compute the frequencies for all of the
# columns in the earnings data set that aren't numeric:


# In general, it's a good habit to use R to do things rather than do them
# manually.
#
# ### The Split-Apply Pattern
# 
# In a data set with categorical features, it's often useful to compute
# something for each category.
#
# The `lapply` and `sapply` functions can compute something for each element of
# a data structure, but categories are not necessarily elements.
# 
# For example, the earnings data set has three different categories in the
# `sex` column.
#
# If we want all of the rows in one category, one way to get them is by
# indexing:


# To get all three categories, we'd have to do this three times.
#
# If we want to compute something for each category, say the mean of the
# `n_persons` column, we also have to repeat that computation three times.
#
# Here's what it would look like for just the `women` category:


# If the categories were elements, we could avoid writing code to index each
# category, and just use an apply function.
#
# The `split` function splits a vector or data frame into a list of groups
# based on a vector of categories.
#
# The first argument to `split` is the data, and the second argument is a
# congruent vector of categories.
# 
# For example, to compute means of `n_persons` broken down by sex:


# The result from `split` is a list with one element for each category. The
# individual elements contain pieces of the original `n_persons` column:


# Since the categories are elements in the split data, now we can use `sapply`
# the same way we did in previous examples:


# This two-step process is an R idiom called the _split-apply pattern_.
#
# First you use `split` to convert categories into list elements, then you use
# an apply function to compute something on each category.
#
# Any time you want to compute results by category, you should think of this
# pattern.
# 
# The `tapply` function is a shortcut.
#
# We can use `tapply` to compute the `n_persons` means by `sex` for the
# earnings data:


# Notice that the result is identical to the one we computed before.
# 
# The "t" in `tapply` stands for "table", because the `tapply` function is a
# generalization of the `table` function.
#
# The `aggregate` function is closely related to `tapply`. It computes the same
# results, but organizes them into a data frame with one row for each category.
# 
# As an example, here's the result of using `aggregate` to compute the
# `n_persons` means:


# The `lapply`, `sapply`, and `tapply` functions are the three most important
# functions in the family of apply functions, but there are many more.
# 
# Exercises
# ---------
# 
