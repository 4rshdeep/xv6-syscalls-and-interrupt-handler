import sys
from random import randint

file = open(sys.argv[1], "w")

for i in range(1000):
	file.write(int(randint(0,9)))
	file.write("\n")