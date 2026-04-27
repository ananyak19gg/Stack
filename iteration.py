'''import numpy as np
arr = np.array([1,2,3])
for x in arr:
    print(x)
#2-D
arr = np.array([[1, 2, 3], [4, 5, 6]])
for x in arr:
#  for y in x:
   # print(y)
 print(x)
 #nditer - n dimesions
arr = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
for x in np.nditer(arr):
  print(x)


#op_dtypes - to change the existing datatype 
arr = np.array([1,2,3])
for x in np.nditer(arr, flags=['buffered'], op_dtypes=['S']):
   print(x)

#different step size
arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
for x in np.nditer(arr[:, ::2]):
  print(x)


#Array join
#in NumPy we join arrays by axes.
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.concatenate((arr1, arr2))
print(arr)
#2-D
import numpy as np
arr1 = np.array([[1, 2], [3, 4]])
arr2 = np.array([[5, 6], [7, 8]])
arr = np.concatenate((arr1, arr2))
print(arr)
'''
#array split
import numpy as np
arr = np.array([1, 2, 3, 4])
newarr = np.array_split(arr, 3)
print(newarr)
print(newarr[1])

arr = np.array([[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]])
newarr = np.array_split(arr, 3) # we can use axis=1 as well to split along the column
print(newarr)
#hsplit is an alternative to split into 3 2-d arrays along column
# hsplit/ hstack
#alternatives to vstack() and dstack() are vsplit() and dsplit()

#Searching Arrays
arr = np.array([1, 2, 3, 4, 4, 5, 7])
x = np.where(arr == 4)
print(x)

 



