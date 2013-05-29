SEAN BRICELAND
HWK #4 - ReadMe File

i) FILES SUBMITTED :-

main.m
- Main driver code for running the bayes filter algorithm
- Includes an 8 time step loop to execute the process update (proc_update.m) and observation update(obser_update.m) functions.

init_states.m
- Contains the code for initializing a discrete BELIEF state structure for holding information pertaining to the environment
- Significantly hold the probability mass for each state

proc_update.m
- Contains the code to update the probability masses of each state given the process of our project
- Takes in a state struct and an enum representing the action took

observ_update.m
- Contains the code to update the probability mases of each state given the observation method. In our class  the robot observes whether it is in a yellow or pink state.

normalize.m
- Given a belief state, normalize its probability masses so that their sum is 1. 
- This is important since we know our robot is always inside the environment thus his probability of being in any one of our 22 states is 100%. AKA - the sum of all belief state probability masses = 1!

hw4logfile.log
- The log file that contains specific prints of the data for each step of the algorithm
- After each update and normalization there is a print of all the belief state probability masses.

plot0.png, plot1.png, ..., plot8.png
- These are the plots of our distributions after each time step.
- They are labelled 0-8
	** plot0.png being the initial uniform distribution of all our states, prior to any steps!
	** 1-8 representing the data at each step

ii) PARAMETER VALUES :- 


a) process model:-
	noise probability used: 0.1 chance robot doesn't move in time step, (0.9 or remaining percent used on "successful" move)

b) measurement/observation model :-
	noise probability used: 0.2 chance to pick wrong color when validating. (0.8 reward, 0.2 penalty)
