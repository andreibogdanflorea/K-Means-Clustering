<div align="left">
  <h1>K-Means Clustering</h1>
  <h3>An Octave/MATLAB project for computing the K-Means Clustering of a dataset</h3>
</div>
<br/>
<br/>

## How to use ##
In Octave/MATLAB, use:

`centroids = clustering_pc(points, NC)`

where:

* points is a NxD matrix containing N points that are D-dimensional
* NC is the number of clusters

You can compute the cost of the clustering by using:

`cost = compute_cost_pc(points, centroids)`

where:

* points is the same NxD matrix
* centroids is the previously determined NCxD matrix

