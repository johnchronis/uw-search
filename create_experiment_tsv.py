#!/usr/bin/env python

from os import popen
from subprocess import call
from pandas import read_csv
import sys
import subprocess


lines = []
algorithms = ["is", "sip", "bs"]

recs = ["8"]

sizes = ["10000"] #00000","1000000", "10000000"] #["1000","10000", "100000", "1000000", "10000000"] # "100000000", "1000000000"]
#runs = {"1000":"10000","10000":"10000", "100000":"1000", "1000000":"1000", "10000000":"100"} #"100000000":"2", "1000000000":"1"}


dataset = "file"
params = ["src/datasets/fb/fb-10000.txt"] #["0.5","1.05","1.25","1.5"]
#params = ["/mnt/datasets/newman","/mnt/datasets/wiki"]
#param =  "1542497071"

for size in sizes:
  #  times=runs[size]
  for alg in algorithms:
    for rec in recs:
      for param in params:
        s=size+"\t"+dataset+"\t"+param+"\t"+alg+"\t"+rec+"\t"+"1"
        for i in range(1): #range(int(times)):
          lines.append(s)


call(['rm', '-rf','run.tsv'])
with open("experiments.tsv", "w") as file:
  file.write("DatasetSize\tDistribution\tParameter\tSearchAlgorithm\tRecordSizeBytes\t#threads\n")
  for line in lines:
    file.write(line+'\n')



