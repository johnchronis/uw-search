#!/usr/bin/env python

from os import popen
from subprocess import call
from pandas import read_csv
import sys
import subprocess

call(['make', 'searchbench'])
run_param = ['Run','DatasetSize','Distribution','Parameter','#threads','SearchAlgorithm','RecordSizeBytes']

with open("outfile", "w") as log_file:
    subprocess.run(["./searchbench","runs.tsv"], stdout=log_file)

df = read_csv("outfile", sep='\t')

#print(df.groupby(run_param)['TimeNS'].describe(percentiles=[.25,0.75]))
print(df.groupby(run_param)['TimeNS'].describe(percentiles=[.5]))

