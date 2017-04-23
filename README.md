# Racket-Project
## Author: Declan Duffy
## Under taken as part of my BSc (hons) in Computing in Software Development at GMIT
## G00318025

### Project Description
This project is based on the maths portion of the popular TV show - Countdown. Written in Racket this project will generate a random three digit number (101 -999) and will also pick up to 6 other numbers (consisting of 4 smaller numbers and 2 big numbers - 25, 50, 75 and 100, while the small numbers are 1 - 10 inclusive with 2 of every number e.g. 1,1,2,2). Then a function will be used to decide if this sum if solvable (telling the person if it's not solvable) by giving an exact answer for an answer somewhere close to the number given. The project will be made using the Dr. Racket IDE.

### Informed Development
A portion of the iterative work done on this project was a result of adapting class work shown to us by Dr. Ian McLoughlin and through the tutorial - http://beautifulracket.com.

### My development
Over the course of doing this project I found it to be very challenging and tried several different approachs to try and solve it. One of my first ways was that I defined 6 random numbers and then I made functions that would do sum/ mult/ div/ and subtraction but this would have taken a long time to write a very brute-force-ish script. After that I decided to try using more recursions along with permutations and cartesian-product in order to achieve lists with both numbers and operands in them but I couldn't append those two lists together and permutate through that new list to get a result I could evaluate to an answer. Instead they become a list of both numbers and operands on a new list and this gave me every permutation of the 6 random numbers as well as the permutations of the 5 operands but I did not know how to wittle these lists down so that the lists would have numbers and operands on them while also being seperate lists for a certain set on that list to be passed to the stack (an idea from class i'll discuss later on) to get an answer. I tried the flatten function to reduce the number of brackets I had on my lists but they would either remove all the brackets on this list and gave me way too much to evaluate on the stack at once or my program would run out of memory. This is what lead me to think of trying stacks to evaluate the lists because I thought that they would accept a certain list of numbers and operands to give me an appropriate output and I was able to get the stacks working from the beautiful racket tutorial. This however, did not solve my problem and instead would return the numbers I was giving the stack but it would return the operands as #<void>. Thus, I could not find a way to effectively integrate the code I had wrote with the beautifulRacket stack tutroial and while they do work somewhat togther they don't work in a fashion that would allow the code itself to figure out the answers for all permutations and then chose the one that is closest to the target number that was originally set out.

### How to Run
All the code for this project is wrote in the Countdown-Solution.rkt file where the file can be ran but it also can use the stacker.rkt which will allow the user to run all the code in Countdown-Solution file effectively acting as a "Runner" class but allowing the person 

### References
http://beautifulracket.com - used for stacks
https://github.com/theory-of-algorithms/example-scheme - examples used for reference and help from Dr. Ian McLoughlin
