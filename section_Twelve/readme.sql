# # DATA IS GONNA GET MESSY. 

# -- we are going to start working with complicated data

# -- joins, primary keys, foreign keys... 

# -- with books for example, how do you track things like... versions? 
# -- is that a new column on your table? 
# -- what about authors, First name last name works for solo books but what about multiple authors on one book 


# -- now what about customers... there are a lot of different customers that might buy the same books
# -- how would we track them?

# -- Passwords? Emails? ORders? What are they ordering? are you adding the order to the original table? 

# ## How to do it beteR?! 

# -- a One to Many Relationship!ALTER

# ie: 

# Customers: 
# customer id 
# First_name
# Last_lame


# Orders: 
# OrderID
# amount
# Date
# CustomerId

# USING THE CUSTOMER id, you can connect the two TABLES


# NOW WHEN DEFINING A SCHEMA, YOU NEED to be aware of the Primary Key 

# THE primary key must always be unique. 

# a primary key from a separate table is... a foreign key!
