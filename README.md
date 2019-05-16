## Efficiently Searching In MemorySorted Arrays
This repo will host the code used in the paper 
["Efficiently Searching In-Memory Sorted Arrays:Revenge of the Interpolation 
Search?"](http://pages.cs.wisc.edu/~jignesh/publ/Revenge_of_the_Interpolation_Search.pdf).

We have implemented various search methods and a benchmark framework that allows
to configure various parameters like the:
+ size of the dataset  
  (minimum size: 1000 records)
+ distribution 
+ parameter of the distribution
+ search algorithm  
    (Interpolation Search, SIP, TIP, Binary Search)  
+ record size  
    (each record contains an 8 Byte Key and a Payload that is controlled by the record size)
+ number of threads






## Compilation
1) Run the install script "install.sh", which will download clang5, openmp,
   python3 and pandas. clang5 will be downloaded inside this repo.
2) Run make to produce the "serchbench" executable.

+ The installation script is tested on Ubuntu 16.04 and 18.04



## Performance Measurement



To measure the performance of an algorithm for a given dataset, we randomly
permute the keys contained in the dataset and search for all of them. We measure
the overall time to search subsets of 1,000 keys, this is called a run. 

In our evaluation, we compare the algorithms based on the time to perform one
search. This is calculated as the median of the measured times of the multiple
runs. The search time for each run is an average over the time to search each
subset.
