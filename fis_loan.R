fis = newfis('Loan');


fis <- addvar(fis, 'input', 'Salary', c(0, 100000));
fis <- addvar(fis, 'input', 'Period of Employment', c(0, 40));


fis <- addmf(fis, 'input', 1, 'low', 'trapmf', c(0, 0, 15000,30000));
fis <- addmf(fis, 'input', 1, 'medium', 'trapmf', c(15000, 30000, 50000, 60000));
fis <- addmf(fis, 'input', 1, 'high', 'trapmf', c(50000, 60000, 100000, 100000));


fis <- addmf(fis, 'input', 2, 'very short', 'trimf', c(0,0,4));
fis <- addmf(fis, 'input', 2, 'short', 'trimf', c(3,6,9));
fis <- addmf(fis, 'input', 2, 'medium', 'trimf', c(8,12,16));
fis <- addmf(fis, 'input', 2, 'long', 'trimf', c(12,18,24));
fis <- addmf(fis, 'input', 2, 'very long', 'trimf', c(18,40,40));


rulelist = rbind(c(3,5,3,1,1), c(1,1,1,1,1))
fis <- addrule(fis, rulelist)

#par(mfrow = c(2, 1))
#plotmf(fis, 'input', 1, main = 'Salary')
#plotmf(fis, 'input', 2, main = 'Period of Employment')
gensurf(fis)