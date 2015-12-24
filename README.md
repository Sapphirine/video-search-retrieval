# video-search-retrieval
201512-28

In this project, we aim to develop a system to automatically search and retrieve similar videos in large scale dataset. This system can be extremely useful for many important applications in our life, such like surveillance system. Our system consists of three parts. (1) Video representation: motivated by the great success of deep learning approaches, we use 3D CNN to extract feature for representing video. (2) Hash: we use LSH to learn a hashing function on UCF101 dataset based on the video feature vector extracted by 3D CNN, and generate a binary code for each video. (3) Retrieval: a video retrieval system based on hamming distance and corresponding visualization interface are developed. The effectiveness of our sysytem is proven by the experimental result on UCF101, which is a large scale video dataset. When we set the number of videos retrieved by the system as 6, our system achieves average precision of 94.4% on top-1 retrieval. Through the visualization website demo, users can indicate the specific query video and see the retrieved videos of high similarity.

Dataset:
UCF101: http://crcv.ucf.edu/data/UCF101.php