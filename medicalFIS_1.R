library(shiny)
library(FuzzyR)
fis = newfis('medical');

fis <- addvar(fis, 'input', 'temperature', c(30, 45));
fis <- addvar(fis, 'input', 'headache', c(0,10));
fis <- addvar(fis, 'output', 'Urgency', c(0,100));


fis <- addmf(fis, 'input', 1, 'very_low', 'trimf', c(26.25, 30, 35.2));
fis <- addmf(fis, 'input', 1, 'low', 'trimf', c(34.5, 35.5, 36.5));
fis <- addmf(fis, 'input', 1, 'normal', 'trimf', c(35.5, 36.5, 37.5));
fis <- addmf(fis, 'input', 1, 'high', 'trimf', c(36.5, 37.8, 39));
fis <- addmf(fis, 'input', 1, 'very_high', 'trimf', c(38.1, 45, 46));


fis <- addmf(fis, 'input', 2, 'normal', 'trimf', c(-1, 0, 3));
fis <- addmf(fis, 'input', 2, 'mild', 'trimf', c(0, 3, 7));
fis <- addmf(fis, 'input', 2, 'severe', 'trimf', c(4.5, 10, 11));

fis <- addmf(fis, 'output', 1, 'slight', 'trimf', c(-1, 0, 30));
fis <- addmf(fis, 'output', 1, 'medium', 'trimf', c(10, 35, 60));
fis <- addmf(fis, 'output', 1, 'emergency', 'trimf', c(45, 100, 101));

rulelist = rbind(c(1,0,3,1,2),c(5,0,3,1,2),c(3,1,1,0.5,2),c(2,0,2,1,1), c(4,0,2,1,1), c(0,2,2,1,1), c(0,3,3,1,1))
fis <- addrule(fis,rulelist)

#par(mfrow = c(3,1))
#plotmf(fis, 'input', 1, main = 'temperature')
#plotmf(fis, 'input', 2, main = 'headache')
#plotmf(fis, 'output', 1, main = 'urgency')
gensurf(fis)
