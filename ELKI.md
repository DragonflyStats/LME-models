ELKI
=========
ELKI is an open source (AGPLv3) data mining software written in Java. The focus of ELKI is research in algorithms, with an emphasis on unsupervised methods in cluster analysis and outlier detection. 
In order to achieve high performance and scalability, ELKI offers many data index structures such as the R*-tree that can provide major performance gains. 
ELKI is designed to be easy to extend for researchers and students in this domain, and welcomes contributions in particular of new methods. 
ELKI aims at providing a large collection of highly parameterizable algorithms, in order to allow easy and fair evaluation and benchmarking of algorithms.
<hr>
#### Design Goals
- Extensibility - ELKI has a very modular design. We want to allow arbitrary combinations of data types, distance functions, algorithms, input formats, index structures and evaluations methods
- Contributions - ELKI grows only as fast as people contribute. By having a modular design that allows small contributions such as single distance functions and single algorithms, we can have students and external contributors participate in the progress of ELKI
- Completeness - for an exhaustive comparison of methods, we aim at covering as much published and credited work as we can
Fairness - It is easy to do an unfair comparison by badly implementing a competitor. We try to implement every method as good as we can, and by publishing the source code allow for external improvements. We try to add all proposed improvements, such as index structures for faster range and kNN queries
- Performance - the modular architecture of ELKI allows optimized versions of algorithms and index structures for acceleration
- Progress - ELKI is changing with every release. To accomodate new features and enhance performance, API breakages are unavoidable. We hope to get a stable API with the 1.0 release, but we are not there yet.
