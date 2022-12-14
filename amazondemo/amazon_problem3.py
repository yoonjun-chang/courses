# While strolling in a garden, you came across a pattern of flowers. It goes as follows:
# The shape of the pattern is a square.
# The pattern consists of variety of flowers. Let's represent each type of lower by an alphabet.
# If a single flower type is used, then we use 'A' to represent the flower and the pattern is 2*2 grid with all 'A's:
#         AA
#         AA
# With every additional flower type used, each of the dimensions increases by 2.
# The next alphabet letter is chosen to represent the type of flower.

#input
n = int(input()) 

#square dimensions
dimension = n * 2    

#empty grid for garden
grid = []       
for i in range(dimension):
    grid.append(" ")
flower_grid = []
for j in range(dimension):
    flower_grid.append(list(grid))
    
#creating two-dimensinal array using comprehension
flower_grid = [[' ' for i in range(dimension)] for j in range(dimension)]

low = n-1
high = n
#type of flower
current = 65 #'A'
while low >= 0:                            
    for i in range(low, high + 1):  #low = 1 high = 5
        if i == low or i == high:
            for j in range(low, high + 1):
                flower_grid[i][j] = chr(current)
        else:
            flower_grid[i][low] = chr(current)
            flower_grid[i][high] = chr(current)
    current += 1
    low -= 1
    high += 1

for rows in flower_grid:
  print(rows)
    
#for better presentation
for rows in flower_grid:
  print(*rows)