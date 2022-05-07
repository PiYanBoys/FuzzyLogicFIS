fis = newfis("tipper", fisType = "tsk", andMethod = "prod")
fis = addvar(fis, "input", "service", c(0, 10), "singleton.fuzzification")
fis = addvar(fis, "input", "food", c(0, 10), "singleton.fuzzification")
fis = addvar(fis, "output", "tip", c(0, 30))
    
    
fis = addmf(fis, "input", 1, "poor", "gaussmf", c(1.5, 0, 1))
fis = addmf(fis, "input", 1, "good", "gaussmf", c(1.5, 5, 1))
fis = addmf(fis, "input", 1, "excellent", "gaussmf", c(1.5, 10, 1))
        
        
fis = addmf(fis, "input", 2, "rancid", "trapmf", c(0,0,1,3,1))
fis = addmf(fis, "input", 2, "delicious", "trapmf", c(7,9,10,10,1))
        
        
fis = addmf(fis, "output", 1, "cheap", "linearmf", c(5, 0.5, 0.5))
fis = addmf(fis, "output", 1, "average", "linearmf", c(15, 0.5, 0.5))
fis = addmf(fis, "output", 1, "generous", "linearmf", c(25, 0.5, 0.5))
        
rl = rbind(c(1, 1, 1, 1, 2), c(2, 0, 2, 1, 1), c(3, 2, 3, 1, 2))
fis = addrule(fis, rl)
    
gensurf(fis)