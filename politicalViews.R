###############################################################################################
# Understanding Political Views of US Citizens by their Age from General Social Survey dataset
###############################################################################################

### Loading the GSS dataset
load(url("http://bit.ly/dasi_gss_data"))

dim(gss)  # check dimensions of GSS dataset. It has 57061 rows and 114 variables

# We will select two variables for our analysis
#       1) Age of the Citizen (Numerical Variable)
#       2) Political View of the Citizen (Categorical Variable)
#               1  EXTREMELY LIBERAL
#               2  LIBERAL
#               3  SLIGHTLY LIBERAL
#               4  MODERATE
#               5  SLGHTLY CONSERVATIVE
#               6  CONSERVATIVE
#               7  EXTRMLY CONSERVATIVE

# Creating a new GSS dataset from the aggregate of Political Views by Age 
ngss <- aggregate(gss['polviews'],list(views=gss$polviews,Age=gss$age),length)

library(ggplot2) # Loading ggplot2 for exploratory analysis

qplot(ngss$Age,ngss$polviews,color=ngss$views,geom="smooth",
      main="Political Views in United States by Age",
      xlab="Age",ylab="Count")

