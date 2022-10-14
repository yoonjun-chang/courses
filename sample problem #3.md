ABC is a right triangle, 90° at B.
Therefore, ∠ABC = 90°.

Point M is the midpoint of hypotenuse AC.

You are given the lengths AB and BC.
Your task is to find ∠MBC (angle Θ°, as shown in the figure) in degrees.

Input Format

The first line contains the length of side AB.
The second line contains the length of side BC.

# Enter your code here. Read input from STDIN. Print output to STDOUT
import math

ab = int(input())
bc = int(input())


hyp = math.hypot(ab,bc)
hyp = hyp/2
adj = bc/2

print(round(math.degrees(math.acos(adj/hyp))),end='\u00B0')

