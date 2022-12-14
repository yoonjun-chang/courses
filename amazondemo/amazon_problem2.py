# sample Amazon demo assessment problem #2

# The greatest common divisor (GCD), also called highest common factor (HCF) of N numbers is the largest positive integer
# that divides all numbers without giving a remainder.
# Write an algorithm to determine the GCD of N positive integers

# input:
# Two arguments
# -num, an integer representing the number of positive integers (N)
# -arr, a list of positive integers


# Test case 1:
# 5, [2,3,4,5,6]

# Expected Return Value:
# 1

# Test case 2:
# 5, [2,4,6,8,10]

# Expected Return Value:
# 2

def generalizedGCD(num,arr):
    for j in range(max(arr)-1):
        lst = []
        for i in arr:
            if i >= j and j != 0 and i%j == 0:
                lst.append(i)
                if len(lst) == 5:
                    ans = j
    return ans

s = []
s1 = 5
print(generalizedGCD(s1,s))