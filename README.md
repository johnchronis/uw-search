## Efficiently Searching In MemorySorted Arrays
This repo will host the code used in the paper 
["Efficiently Searching In-Memory Sorted Arrays:Revenge of the Interpolation 
Search?"](http://pages.cs.wisc.edu/~jignesh/publ/Revenge_of_the_Interpolation_Search.pdf).

## Introduction
We have implemented various search methods and a benchmarking framework that
measures the performance of these methods. Using the benchmark framework we can
easily control the following parameters:
+ size of the dataset  
  (minimum size: 1000 records)
+ distribution 
+ parameter of the distribution
+ search algorithm  
    (Interpolation Search, SIP, TIP, Binary Search)  
+ record size  
    (each record contains an 8 Byte Key and a Payload that is controlled by the record size)
+ number of threads

## Performance Evaluation
To measure the performance of an algorithm for a given dataset, we randomly
permute the keys contained in the dataset and search for all of them, this is
called a run.
To measure the execution time of each algorithm we measure the overall time to search
subsets of 1,000 keys for each run. To compare algorithms we use the time required to 
seacrh for one record.  The search time for each run is an average over the time 
to search each subset.

## How to use
### Compilation
1) Run the install script "install.sh", which will download clang5, openmp,
   python3 and pandas. clang5 will be downloaded inside this repo.
2) Run make to produce the "searchbench" executable.

+ The installation script is tested on Ubuntu 16.04 and 18.04

### Usage
The "searchbench" execution expects one argument, a tsv file of experiments. Each line of the 
tsv specifies the parameters of one experiment, as described in  [Introduction](#introduction).
One experiment uses one algorithm and a dataset and reports the time required to search each subset.

```bash
$ cat experiments.tsv
DatasetSize	Distribution	Parameter	SearchAlgorithm	RecordSizeBytes	#threads
2000	      uniform	      42	      bs	              8	              1
2000	      uniform	      42	      sip 	            8	              1

$ ./searchbench experiments.tsv
Loading Dataset size:2000, distribution: uniform, distribution parameter: 42

Run	DatasetSize	Distribution	Parameter	#threads	SearchAlgorithm	RecordSizeBytes	TimeNS

Running experiment: 2000 uniform 42 8 b-lin 1
0	  2000        uniform	        42	      1	        bs            8	              130.277
0	  2000	      uniform	        42	      1	        bs	          8	              121.141

Running experiment: 2000 uniform 42 8 i-opt-8 1
1	  2000	      uniform	        42	      1	        sip	            8	              73.189
1	  2000	      uniform	        42	      1	        sip	            8	              66.527
```

We provide a helper function implemented in Python "time.py" that compiles the code,
runs the "searchbench" using a as input the file named "experiments.tsv" and reports back for each run
the time to search one record, calculated as described in Section [Performance Evaluation](#performance-evaluation)

```bash
$ python3 gettimes.py 
make: 'searchbench' is up to date.
Loading Dataset size:2000, distribution: uniform, distribution parameter: 42
Running experiment: 2000 uniform 42 8 bs 1
Running experiment: 2000 uniform 42 8 sip 1

Run  DatasetSize  Distribution  Parameter  #threads  SearchAlgorithm  RecordSizeBytes
0    2000         uniform       42         1         bs               8                  114.4260
1    2000         uniform       42         1         sip              8                   71.1515
```

### TSV format
The exeperiment tsv should include the following header:
```bash
DatasetSize	Distribution	Parameter	SearchAlgorithm	RecordSizeBytes	#threads
```
All the values must be tab separated.

### Datasets
A dataset is identified by its name and one parameter as described in the following table:

| Dataset       | Parameter     |
| ------------- |:-------------:|
| uniform       | seed (integer)|
| gap     | gap parameter       |
| fal | shape parameter (double)    |
| cfal | shape parameter (double)    |
| file | path of file |

When the dataset is "file" then the file specified in "path of file" specifies all the keys that
will be used in the benchmark. The file should contain one key per line. Examples of dataaset file can be found
in src/datasets folder.

For explanation of the parameters and dataset please refer to our paper: ["Efficiently Searching In-Memory Sorted Arrays:Revenge of the Interpolation 
Search?"](http://pages.cs.wisc.edu/~jignesh/publ/Revenge_of_the_Interpolation_Search.pdf).

### Algorithms

The algorithm we have implemented in our code are:

| Dataset       | Parameter     |
| ------------- |:-------------:|
| is       | Interpolation Search |
| bs     | Binary Search      |
| sip | SIP - Slope Reuse Interpolation Search    |
| tip | TIP - Three Point Interpolation Search    |



