# This is a simple function to create a linguistic variable
# for age with 3 linguistic labels - young, middleaged and old

# the first statement creates a new fis with string name test
# and R variable a. The fis takes certain defaults which you can
# ignore for the moment.
fis = newfis('Test');


# This adds a variable called 'linguistic age' to the fis which is
# of type input and lies between 0 and 70
fis <- addvar(fis, 'input', 'age', c(0,70));
fis <- addvar(fis, 'input', 'weight', c(65,120));
fis <- addvar(fis, 'input', 'feet size', c(4,12));

# We now add three membership functions - read the help to understand the parameters
fis <- addmf(fis, 'input', 1, 'young', 'gaussmf', c(10,0));
fis <- addmf(fis, 'input', 1, 'middleage', 'gaussmf', c(10,40));
fis <- addmf(fis, 'input', 1, 'old', 'gaussmf', c(10,70));


fis <- addmf(fis, 'input', 2, 'small', 'trimf', c(43,65,87));
fis <- addmf(fis, 'input', 2, 'medium', 'trimf', c(70.5,92.5,114.5));
fis <- addmf(fis, 'input', 2, 'large', 'trimf', c(98,120,142));


fis <- addmf(fis, 'input', 3, 'small', 'trapmf', c(0,0,5,7));
fis <- addmf(fis, 'input', 3, 'medium', 'trapmf', c(6,7,9,10));
fis <- addmf(fis, 'input', 3, 'large', 'trapmf', c(9,11,18,19));

  # This plots the membership functions
par(mfrow = c(3, 1))
plotmf(fis, 'input', 1, main = 'Age')
plotmf(fis, 'input', 2, main = 'Weight')
plotmf(fis, 'input', 3, main = 'Feet Size')