#!/bin/bash
#SBATCH --nodes 4
#SBATCH -A liu5 -p green
#SBATCH -J  BulkSiWF
#SBATCH -t 0-01:00:00

# Path to ABINIT EXE
if [ "$NSC_RESOURCE_NAME" == 'triolith' ]; then
    abinit=/software/apps/abinit/7.10.2/build01/bin/abinit
else
    abinit=/software/testing/abinit/6.12.1/bin/abinit
fi

rm -f out* *.out log.abinit tmp* *.nc *_DDB *_DEN *_EIG

ln -s ../step_1_get_converged_charge_density/out_bulk_Si_chg_DEN .
# Run ABINIT
mpprun $abinit < bulk_Si_WF.files >& log.abinit

rm -f tmp* *.nc *_DDB
#End of script
