# One Pass Late Fusion Multi-view Clustering

Matlab code for ICML2021：One Pass Late Fusion Multi-view Clustering

core function: onePassLateFusionMVCBeta.m

input: 1. multiple kernel dataset; 2. the number of class

Please cite:

```

@InProceedings{pmlr-v139-liu21l,
  title = 	 {One Pass Late Fusion Multi-view Clustering},
  author =       {Liu, Xinwang and Liu, Li and Liao, Qing and Wang, Siwei and Zhang, Yi and Tu, Wenxuan and Tang, Chang and Liu, Jiyuan and Zhu, En},
  booktitle = 	 {Proceedings of the 38th International Conference on Machine Learning},
  pages = 	 {6850--6859},
  year = 	 {2021},
  editor = 	 {Meila, Marina and Zhang, Tong},
  volume = 	 {139},
  series = 	 {Proceedings of Machine Learning Research},
  month = 	 {18--24 Jul},
  publisher =    {PMLR},
  pdf = 	 {http://proceedings.mlr.press/v139/liu21l/liu21l.pdf},
  url = 	 {http://proceedings.mlr.press/v139/liu21l.html},
  abstract = 	 {Existing late fusion multi-view clustering (LFMVC) optimally integrates a group of pre-specified base partition matrices to learn a consensus one. It is then taken as the input of the widely used k-means to generate the cluster labels. As observed, the learning of the consensus partition matrix and the generation of cluster labels are separately done. These two procedures lack necessary negotiation and can not best serve for each other, which may adversely affect the clustering performance. To address this issue, we propose to unify the aforementioned two learning procedures into a single optimization, in which the consensus partition matrix can better serve for the generation of cluster labels, and the latter is able to guide the learning of the former. To optimize the resultant optimization problem, we develop a four-step alternate algorithm with proved convergence. We theoretically analyze the clustering generalization error of the proposed algorithm on unseen data. Comprehensive experiments on multiple benchmark datasets demonstrate the superiority of our algorithm in terms of both clustering accuracy and computational efficiency. It is expected that the simplicity and effectiveness of our algorithm will make it a good option to be considered for practical multi-view clustering applications.}
}

```
