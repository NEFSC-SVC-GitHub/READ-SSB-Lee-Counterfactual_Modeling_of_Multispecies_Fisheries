

#!/bin/bash

#BSUB -W 00:15                            # How much time does your job need (HH:MM)
#BSUB -q short                            # Which queue {short, long, parallel, GPU, interactive}
#BSUB -J "samsim[1-1]"                    # Job Name
#BSUB -R rusage[mem=1000] 

#BSUB -o "./%J.out"
#BSUB -e "./%J.err"



# remove old directory
rm -r -f groundfish-MSE/

# load the git module
module load git/2.1.3

# clone the current repository
git clone https://github.com/COCA-NEgroundfishMSE/groundfish-MSE



module load R/3.4.0 
module load gcc/5.1.0

Rscript ./processes/runSim.R --vanilla
# Rscript $HOME/COCA/processes/runSim.R --vanilla






# #BSUB "span[hosts=1]"                     #Memory useage

# Name the output and error files