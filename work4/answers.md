# Question 1


# Question 2
## How does increasing the II affect the loop latency?
Increasing the Iteration Interval in **general** should increase the
latency. In this case the II should be set to 1, increasing it doesn't
achieve anything else. 

## What are the trends?
The trend is that there is no real change after setting II to 1


## At some point setting the II to a larger value does not make sense, what is this value?
For this case, it is 1

## How would you calculate that value for a general for loop? 

# Question 3

## Compare the designs with/without conditionals. Is there a difference in performance and/or resource usage?
BRAM: 1
DSP: 1
FP:120
LUT:242
URAM:0

BRAM:1
DSP:2
FP:56
LUT:220
URAM: 0



## Does the presence of the conditional branch have any effect when the design is pipelined?If so, how and why?
No it does not have any effect on the ability to pipeline by itself only. This is due to the limited number of
memory ports, which results in Vitis not being able to schedule `load` operations. However with all the variables
in RAM\_T2P type storage, I was able to obtain a latency of just 31 cycles at the cost of a massive increase in FP and LUT usage.


# Question 4
## Is there an opportunity for loop partitioning in FIR filters? Compare your hardware designs before and after. What is the difference in performance? How do the number of resource change? Why?
There is an opportunity for loop partitioning. The shift\_register can be updated in a different loop to the one where multiply accumalate operation happens in.
There is actually an increase in latency, it is pretty much double of our baseline implementation. In addition to the increase in latency there is also an increase in 
hardware usage. There is a doubling of FP units and a moderate increase in LUTs. This occurs because the loop isn't pipelined, meaning an execution of one loop needs to complete 
before the next loop can begin.

# Question 5

## Compare the memory partitioning parameters: block cyclic and complete.


## What is the difference in performance and resource usage (particularly with respect to BRAM and FFs)?


## Which one gives the best performance?
