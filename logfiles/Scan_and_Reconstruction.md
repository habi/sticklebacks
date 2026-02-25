---
title: How to scan and reconstruct the Sticklebacks
author: David Haberthür
date: 5.12.2023
---

# Scan

We scan the fish packed in foam in the [3D printed sample holder](https://github.com/TomoGraphics/Hol3Drs/blob/master/STL/Stickleback.Multiple.stl).
We can fit them in a field of view scanning them at 17.5 um easily.

# Reconstruct

We reconstruct the fish rotated as such that the vial *1* is on top, aligned correctly, as it would be written normally.
This means that the separator betwen *2* and *3* is horizontal to the separator between *5* and *6*.
This facilitates consistent separation of the scans into different regions with our Jupyter notebook, aiding further processing.
The bottom of the reconstruction range is set ~200 slices below the 'base plate' with the numbers.

The gray value range of the reconstructions is adapted to the histogram.
For the first batch (`BucketOfFish_*`) we were *discarding* the highest values in the *logarithmic* histogram, e.g. putting the upper limit at the end of the curve when looking at a region in the head of the fish.
For the second batch (`Sticklebucket_*`) it was harder to find a constistent region in the head of the fish (their otoliths are less pronounced), so we used the standard way of setting the gray values in the histogram, e.g. to 0 and the highest value shown in the histogram at a seemingly dense region, which was often around the first side-fin of the fish.



