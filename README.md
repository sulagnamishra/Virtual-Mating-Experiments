# Virtual-Mating-Experiments
Working code for the VME model 
---------------------------------------
Coding language : R


The Zipped folder contains the following: 

Executable file - do_vme.r -      loads all the necessary packages, functions needed during the model run, 

  makes the initial parameter declarations 
  performs the analysis for the the different scenarios at variable frequencies and local sensitivity analysis.
  Note that sensitivity analysis for each parameter is written in a separate function. 
  The output (tables and figures) are automatically stored/plotted.                                 
  Refer in-line comments in the code for clearer understanding of each function.
                                  
Folders: R - containing all the necessary functions,

         Rodeo - containing the files called by the Rodeo numerical solver,
         
         Refer the var, pros, pars files for state variables, process definations and parameters (units and explanations),
         
         Out - stores all the outputs from the model run
         

Common nomenclature used in the code: 

Scenario: modelling scenarios

Parameters: 
cost: plasmid cost, 

lg: logGamma - plasmid transfer rate constant (expressed in Log 10),

lp: Lap phase of growth,

mt: Maturation time for Transconjugants,

mu: Growth rate constant of the bacteria

Models: 
Forward model : model used for virtual data generation,

Backward model: model used for parameter estimation based on the modelling scenario. 


Please feel free to contact the author for futher details and explanations regarding the code. 

Sulagna Mishra


