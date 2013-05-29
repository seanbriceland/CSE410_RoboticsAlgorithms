SEAN BRICELAND
HWK #5 - ReadMe File

i) FILES SUBMITTED :-

main.m
- Main driver code for running the particle filter algorithm
- Initializes all particles, sets the correct observation(init_co())
- Includes a 15 time step loop to execute:
     process update (proc_update.m) 
     observation update (obser_update.m) 
     resample (resample.m)


init_states.m
- Contains the code for initializing a particle structure for holding all particle info:
** weight
** coordinates
** count of all particles


init_co.m
- Initializes the correct observations for each step. 
** contains mean distance from closest beacon for given sequence of actions


proc_update.m
- Repositions ALL particles according to process action affected by a gaussian noise with variance = 0.2
- Returns updated set of new particles


observ_update.m
- For ALL particles, takes a mean distance measurement to closest beacon
- Applies gaussian noise with variance 0.25 to this measurement
- Uses a Normal Kernel function to compare similarity between this measurement and the correct observation
- Updates the weights of all particles (and normalizes)
- Returns updated particles with new weights. 


resample.m
- Creates regions (see regions.m)
- For total # of particles, generates a random fraction
    assigns the particle with the region containing the fraction to a new particle set. 
- Normalizes weights
- Returns updated set of new particles


regions.m
- Divides and assigns probability regions for each particle



normalize.m
- Given a set of particles, normalize the weights for each particle so that sum of weights is 1. 
- This is important since we change the weights of all particles in both observ_update() and resample().
In observ_update() we are multiplying be fractions, thus "lose weight"
In resample() we recreate our set of particles with a high probability of replacing lower weighted particles with high weighted particles thus likely to have "more weight"


plotNsave.m
-Helper function to keep the main clean
-handles all plotting


distance.m
- ONLY USED FOR TESTING

hw5log.log
- Logfile for hw5. 

/plots/  directory
- I simply made a folder to put all of the plots in to cleanup the files in the hw5 directory.'
- There are 16 plots labelled Scat_Pats_TS0.png - Scat_Pats_TS15.png


ii) PARAMETER VALUES :-
# of particles: 800
Process Update Gaussian Noise applied: 
0.2 mean (i technically used 0 mean and added 0.2)
variance = 0.2

Measurement Update Gaussian Noise applied:
mean = mead distance gathered from measurement to nearest beacon
variance = 0.25

iii) Just note that when you run the main, it will create 16 new plots in the hw5 directory. The plots inside the plot folder were simply moved there for cleaning.