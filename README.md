## Efficiently Searching In MemorySorted Arrays
This repo will host the code used in the paper 
["Efficiently Searching In-Memory Sorted Arrays:Revenge of the Interpolation 
Search?"](http://pages.cs.wisc.edu/~jignesh/publ/Revenge_of_the_Interpolation_Search.pdf).

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
tsv specifies the parameters of one experiment. One experiment uses one algorithm and a dataset and 
reports the time required to search each subset.

We provide a helper function implemented in Python "time.py" that compiles the code,
runs the "searchbench" using a as input the file named "experiments.tsv" and reports back for each run
the time to search one record, calculated as described in Section [Performance Evaluation](#performance-evaluation)













