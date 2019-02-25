import numpy as np
import sys
l = int(sys.argv[2])

file = open(sys.argv[1])
lines = [int(line.strip()) for line in file.readlines()]

print("total  : ", np.sum(lines[:l]))
print("mean  : ", np.mean(lines[:l]))
print("variance  : ", np.var(lines[:l]))
