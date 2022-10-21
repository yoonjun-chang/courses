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