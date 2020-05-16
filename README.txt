Topic: Epidemic Analysis
Author: Abe Park
Date: 05/05/2020

OVERVIEW

The files in this directory analyze the spread of an epidemic with 
using the Reed-Frost model for calculation and observe the effect of the 
effective contact rate in four different categories: the epidemic duration, 
average # of infectives per one period of time, average # of remaining 
susceptible when the epidemic is over, and average # of accumulated removals.


WHERE TO START

To begin, run the epidemic.m file. This runs the data analysis on the 
epidemic with pre-determined sample size (user can change), and four 
different effective contact rate: 0.1, 0.3, 0.5, and 0.7.


Output Figures
1. figure1: a bar graph on the amount of the susceptible, infective, and 
removal in the sample over time periods with the spread probability of 0.1.

2. figure2: a bar graph on the amount of the susceptible, infective, and 
removal in the sample over time periods with the spread probability of 0.3.

3. figure3: a bar graph on the amount of the susceptible, infective, and 
removal in the sample over time periods with the spread probability of 0.5.

4. figure4: a bar graph on the amount of the susceptible, infective, and 
removal in the sample over time periods with the spread probability of 0.7.

5. figure5: a bar graph analysis on the effect of varied effective contact 
rate to the the average epidemic duration, average # of infectives per one 
period of time, average # of remaining susceptible, and average # of 
accumulated removals at the end of 40 samples of the epidemic given a 
specific effective contact rate.


CALCULATION FUNCTIONS
1. ReedFrost.m - calculates the probabilities of s_n+1 outcome using the 
Reed-Frost model of approximation and generates the interval of probable 
outcomes.

2. UpdateSIR.m - updates the SIR by generating a random outcome to the 
Reed-Frost interval of the current SIR.

3. Simulation.m - simulates the calculation of and update of the 
Reed-Frost model given a specific sample size and a specific effective 
contact rate.

4. RunAnalysis.m - calculates the average epidemic duration, average # of 
infective per one period of time, average # of remaining susceptible, and 
average # of accumulated removals at the end of 40 samples of the epidemic 
given a specific effective contact rate.


USEFUL DEFINITIONS

1. Reed-Frost model - a chain binomial, iterative model of how an epidemic 
will behave over time.

2. SIR (sn, in, rn) - susceptible, infectives, removals respectively; 
consider a fixed population and three kinds of individuals are defined in 
it by a disease: 
sn - individuals who can acquire infection upon effective contact with the 
infectives;
in - individuals who have the disease and are capable of transmitting it;
rn = individuals who have passed through the disease process and are no 
longer susceptible or infective.

3. effective contact rate (spread probability) - the probability of disease 
transmission between any susceptible and any infective during one sampling 
interval.
We suppose the sampling intervals are exactly the same length as the 
duration of infectiousness in the infective (= period from an infective 
becoming a removal)