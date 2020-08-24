rm(list=ls())
#options(warn=1)
setwd('/media/sf_Windows_share/Work/Projects/VSE/vse-loggamma/Processing/R')
odir <- "../out/"
dir<-"../Rodeo"
plotCurves<-TRUE
plotCurves_mu<-FALSE
plotCurves_lg<-FALSE
plotCurves_lp<-FALSE
plotCurves_mt<-FALSE
plotCurves_cost<-FALSE
#combinations <- "../in/combination.txt"
suffix<-format(Sys.time(),"%d-%b-%Y-%H.%M.%S") 
# packages
library("deSolve")
library("rodeo")
library("lhs")
library("plyr")
library("reshape2")
library("FME")
# load utility functions
sources <- list.files(path=".", pattern="^func_.+[.]r$", full.names=TRUE)
for (src in sources) {
  source(src)
  print(paste0("loaded '",src,"'"))
}
#.......Basic forward model and data generator
rd <- function(f, ...) {
  read.table(paste0(dir,"/",f), header=TRUE, sep="\t", ...)
}
parmsinit<-c(mu=1.7,cost=0.3,kc=1e10,logGamma=-12,lp = 1.5,mt=1)
#.......Forward model
obs<-forwardmodel(scenario_num=7,parmsinit=parmsinit)
    #.......Backward model (assuming all parameters but logGamma is unknown)
#Scenario 1-7 (Scenarios Vs Sampling frequencies)
out_scenario<-scenario1_7(parmsinit=parmsinit)
    #Scenario 8,9,10 : Loop for changed values of mu, logGamma,lapphase

#case 1- Changed mu and accordingly adjusted phase Effect
out_mu<-scenario_mu()
  #case 2- Changed logGamma
out_lg<-scenario_lg()
#case 3 - Changed lagPhase length and adjusted phase Effect
out_lp<-scenario_lp()

    #Scenario 11: changed mu, fixed numbers of samples taken per doubling time
out_mu_samples<-scenario_mu_samples(forwardsampling=4, backwardsampling=2)

#Scenario 12: changed mt (maturation time for T)
out_mt<-scenario_mt(parmsinit=parmsinit)

#Scenario 13: changed plasmid bearing cost
out_cost<-scenario_cost()





#Predict multiple parameters (mu,cost,logGamma) parmsinit<-c(mu=1.7,cost=0.3,kc=1e10,logGamma=-12,lp = 1.5, pe=8))
