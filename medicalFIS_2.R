library(shiny)
fis = newfis('medical');

fis <- addvar(fis, 'input', 'temperature', c(30, 45));
fis <- addvar(fis, 'input', 'headache', c(0,10));
fis <- addvar(fis, 'output', 'Urgency', c(0,100));


fis <- addmf(fis, 'input', 1, 'very_low', 'gaussmf', c(1.6, 30));
fis <- addmf(fis, 'input', 1, 'low', 'gaussmf', c(1.5, 30));
fis <- addmf(fis, 'input', 1, 'normal', 'gaussmf', c(1.6, 36.5));
fis <- addmf(fis, 'input', 1, 'high', 'gaussmf', c(1.8, 39));
fis <- addmf(fis, 'input', 1, 'very_high', 'gaussmf', c(3, 45));


fis <- addmf(fis, 'input', 2, 'normal', 'gaussmf', c(1.5, 0));
fis <- addmf(fis, 'input', 2, 'mild', 'gaussmf', c(1.6, 3));
fis <- addmf(fis, 'input', 2, 'severe', 'gaussmf', c(3, 10));

fis <- addmf(fis, 'output', 1, 'slight', 'gaussmf', c(13, 0));
fis <- addmf(fis, 'output', 1, 'medium', 'gaussmf', c(11, 35));
fis <- addmf(fis, 'output', 1, 'emergency', 'gaussmf', c(20, 82));

rulelist = rbind(c(1,0,3,1,1), c(2,0,2,0.7,1),c(3,0,1,0.3,1),c(4,0,2,0.7,1), c(5,0,3,1,1), c(0,1,1,0.2,1),c(0,2,2,0.16,1),c(0,3,3,1,1))
fis <- addrule(fis,rulelist)

#par(mfrow = c(4,1))
#plotmf(fis, 'input', 1, main = 'service')
#plotmf(fis, 'input', 2, main = 'food')
#plotmf(fis, 'output', 1, main = 'tip')
gensurf(fis)