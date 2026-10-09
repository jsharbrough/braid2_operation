# Working on Braid2
#### Helpful thoughts for running Braid2

#### Log into braid2 via `ssh`  
    ssh username@braid2.cnsi.ucsb.edu 

  You'll be asked for a password

#### General operation

##### /home partition
The /home partition (/home/$USER) is is where you land when you log in. 
The /home partition is backed up, and there is a small amount of space available there (~250 Gb). Do not store large files there, though. Any large amount of data should be stored on the lab's [Network-Attached Storage array](). Instead, install your programs (ideally using [mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html)) there.

##### /scratch partition
The /scratch partition is where we should operate any computational activities and where we can submit jobs from. 
When first beginning on the system, make a personal folder there.  
    
    mkdir $USER

Inside of this folder, you can make individual folders to house your data for specific projects.

There is also a shared folder for Sharbrough Lab data sharing `/scratch/sharbrough_lab/`. There you can deposit any data that you would like to share between users. When you do so, make sure to make the folder writeable by other members of our lab: 

    chmod -r g+w <folder_name>

##### Submitting jobs with SLURM
To submit a job, you will first build a job submission script. Here is a [sample job submission script](https://github.com/jsharbrough/braid2_operation/blob/main/Braid2.sample_job.sh). To edit the job submission script, I recommend `vi` or `nano`. [Here's a helpful guide](https://www.cs.colostate.edu/helpdocs/vi.html) to `vi` commands. [Here's a helpful guide](https://www.nano-editor.org/dist/latest/nano.html) for `nano`.

Once you have your job submission script ready, submit the job:  
    
    sbatch job.sh

To check on the status of your job, use the command `squeue`:  
    
    squeue -u $USER

This will show you whether your job is pending (PD) running (R), or in some sort of error state. If your job has already completed, it will not be listed by the `squeue` command. 

To cancel on your job, use the command `scancel`:  
    
    scancel <job_id>

Other useful SLURM commands are available [here](https://slurm.schedmd.com/documentation.html).
