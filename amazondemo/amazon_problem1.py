# sample Amazon demo assessment problem #1

# Eight houses, represented as cells, are arranged in a straight line. Each day, every cell competes with its adjacent cells (neighbors). An integer value of 1
# represents an active cell and a value of 0 represents an inactive cell. If the neighbors on both sides of a cell are either active or inactive, then the cell
# becomes inactive on the next day; otherwise the cell becomes active. The two cells on each end have a single adjacent cell, so assume that the unoccupied space
# on the opposite side is an inactive cell. Even after updating the cell state, consider its previous state when updating the state of other cells. The state
# information of all cells should be updated simultaneously.

# Write an algorithm to output the state of the cells after the given number of days.

# Input
# The input to the function/method consists of two arguments:
# -state: a list of integers representing the current state of cells
# -days: an integer representing the number of days.


# Test case 1:
# Input: [1,0,0,0,0,1,0,0,], 1

# Expected Return Value:
#  0 1 0 0 1 0 1 0

# Test case 2:
# Input: [1,1,1,0,1,1,1,1], 2

# Expected Return Value:
#  0 0 0 0 0 1 1 0

def cellCompete(states, days):
    while days != 0:
        if states[1] == 1:        #exception for index 1
            prev = states[0]
            states[0] = 1
        else:
            prev = states[0]
            states[0] = 0
        for i in range(len(states) - 1):
            if i == 0:
                continue
            if (prev == 0 and states[i+1] == 0) or (prev == 1 and states[i+1] == 1):
                prev = states[i]
                states[i] = 0
            else:
                prev = states[i]
                states[i] = 1      
        if prev == 1:             #exception for last index
            states[-1] = 1
        else:
            states[-1] = 0
        days -= 1

    return states
