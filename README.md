Computational performance of a projection and rescaling algorithm
=================================================================

We provide a MATLAB implementation of the projection and rescaling algorithm on synthetic problem instances with varied levels of conditioning.  The code is an implementation of the algorithms described in the paper "Computational performance of a projection and rescaling algorithms" by Pena and Soheili.


Main Files
----------

* TestSimpleBasicProcedures(m,n,N,epsilon): This is the code used to generate and test the set of instances summarized in each row of Table 1, Table 2, and Table 5.
* TestControlledConditionBasicProcedures(m,n,N,epsilon,delta): This is the code used to generate and test the set of instances summarized in each row of Table 3, Table 4, and Table 6.
* TestControlledConditionRescaled(m,n,N,delta): This is the code used to gen- erate and test the set of instances summarized in each row of Table 7.
* TestPartitionRescaled(n,N): This is the code used to generate and test the set of instances summarized in each row of Table 8.
* TestSimpleRescaled(m,n,N): This is the code used to generate and test the set of instances summarized in each row of Table 9. This code also compares the perfor- mance of Algorithm 1 with a modified version that rescales along one direction only including a more efficient update on the projection matrix after each rescaling step.
* MultiEPRA(A,AA,n,z0,U): This code implements Algorithm 1 assuming L=ker(A) and Lperp = ker(AA). Use z0 as starting point for the basic procedure and U to upper bound the rescaling matrices.
* perceptron(P,z0,epsilon): This code implements Algorithm 2
* VN(P,z0,epsilon): This code implements Algorithm 3
* VNA(P,z0,epsilon): This code implements Algorithm 4
* smooth(P,u0,epsilon): This code implements Algorithm 5


Main parameters 
---------------

* N: Number of instances. We used N = 1000 in Table 1 through Table 4, and N = 100
in Table 5 and Table 6. We used N = 500 in Table 7 through Table 9.
* m: Number of rows of the matrix A such that L = ker(A)
* n: Dimension of the ambient space
* epsilon: Rescaling condition parameter
* delta: Upper bound on the values of a subset of randomly chosen positive entries of the most central solution. The smaller delta, the more ill-conditioned the problem. We used delta = 0.001 for the experiments summarized in Table 3, Table 4, Table 6, and Table 7.






