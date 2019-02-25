import numpy as np
import sys
l = int(sys.argv[1])

file = open("xv6/arr")
lines = [int(line.strip()) for line in file.readlines()]

print("total  : ", np.sum(lines[:l]))
print("mean  : ", np.mean(lines[:l]))
print("variance  : ", np.var(lines[:l]))
