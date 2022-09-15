#### INDEXING DATA

# load the earnings data --------------------------------------------------



# create a list and subset it using `[` -----------------------------------




# check the class of a list subset ----------------------------------------



# extract list element using `[[` and check the class ---------------------





# subset a vector index that doesn't exist ------------------------------




# extract a list element that doesn't exist -------------------------------






# subset some rows of data -----------------------------------------------





# subset some rows and columns --------------------------------------------





# subset columns by name --------------------------------------------------





# subset rows with a logical index ----------------------------------------







# subset a single data.frame element --------------------------------------






# subset a single data.frame element, but use drop=FALSE ------------------




#### USING PACKAGES

# install the remotes package ---------------------------------------------







# check the installed packages --------------------------------------------





# load the remotes package ------------------------------------------------





#### PLOTTING WITH `ggplot2`

# install and load the ggplot2 package ------------------------------------





# subset the 2019 earnings data -------------------------------------------






# further subset the 2019 earnings ----------------------------------------





# try just `ggplot(earn19)` -------------------------------------------------






# add a geometry (still doesn't work) ----------------------------------------------------------






# Add an aesthetic mapping (now it works!) --------------------------------







# same plot,  but blue line -----------------------------------------------







# put color in the mapping, rather than the geometry ---------------------






# Specify the labels for a nicer plot -------------------------------------






# save the plot with ggsave -----------------------------------------------





# save the plot by using a plot device ------------------------------------







# make a bar plot ---------------------------------------------------------




# USING THE APPLY FUNCTIONS



# check the class of earn -------------------------------------------------





# check the class of the age column ---------------------------------------






# check the class of all columns with lapply ------------------------------





# lapply to a vector of numbers -------------------------------------------





# use sapply to get the class of each column of earn ----------------------






# use sapply to calculate the sin of each element of x --------------------





# use sapply to identify the categorical columns --------------------------






# now use lapply to get the `table` for each categorical column





# subset earn for women ---------------------------------------------------






# calculate the mean size of each group of women --------------------------






# use split to get a list of n_persons called by_sex -----------------------------------





# check the names and classes of by_sex -----------------------------------------------






# use sapply to calculate the mean size of each group ---------------------







# use the tapply function to simplyfy split-apply -------------------------






# do split-apply by the aggregate function --------------------------------



