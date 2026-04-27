#The array object in NumPy is called ndarray
import numpy 
arr = numpy.array([1, 2, 3, 4])
print(arr)
print(type(arr))
import numpy as np
arr = numpy.array([1, 2, 3, 4])
print(arr)
print(np.__version__)
import numpy as np

arr = np.array((1, 2, 3, 4, 5))

print(arr)
#0-arrays - scalar
import numpy as np
arr = np.array(42)
print(arr)
#1-D arrays - An array that has 0-D arrays as its elements 
import numpy as np
arr = numpy.array([1, 2, 3, 4])
print(arr)
#2-D array-often used to represent matrix or 2nd order tensors
arra = np.array([[1, 2, 3], [4, 5, 6]])
#3-D arrays
arrb = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])

print(arr.ndim)
print(arra.ndim)
print(arrb.ndim)

arrd = np.array([1, 2, 3, 4, 5], ndmin=5)
print(arrd)
print('number of dimensions : ', arrd.ndim)

#ARRAY IDEXing
import numpy as np
arr = np.array([1, 2, 3, 4])
print(arr[2] + arr[3])
#2-D mai [dimension, index]
arr = np.array([[1,2,3,4,5], [6,7,8,9,10]])
print('2nd element on 1st row: ', arr[0, 1])
#3-D mai 
arr = np.array([[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]])
print(arr[0, 1, 2])
#negative indexing
arr = np.array([[1,2,3,4,5], [6,7,8,9,10]])
print('Last element from 2nd dim: ', arr[1, -1])
#slicing of array
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[:4])
print(arr[-3:-1])
#[start:end:step]
print(arr[1:5:2])
print(arr[::2])
arr = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(arr[1, 1:4])
#From both elements, return index 2
print(arr[0:2, 2])
#From both elements, slice index 1 to index 4 (not included), this will return a 2-D array
print(arr[0:2, 1:4])
'''i - integer
b - boolean
u - unsigned integer
f - float
c - complex float
m - timedelta
M - datetime
O - object
S - string
U - unicode string
V - fixed chunk of memory for other type ( void )
'''
print(arr.dtype)
arr = np.array([1, 2, 3, 4], dtype='S')
print(arr)
print(arr.dtype)

arr = np.array([1, 2, 3, 4], dtype='i4')
print(arr)
print(arr.dtype)

#astype function
arr = np.array([1.1, 2., 3.1])
newarr = arr.astype('i')
print(newarr)

arr = np.array([1.1, 2.1, 3.1])
newarr = arr.astype(int)
print(newarr)

arr = np.array([1, 0, 3])
newarr = arr.astype(bool)
print(newarr)


# copy vs view
#COPY-
arr = np.array([1, 2, 3, 4, 5])
x = arr.copy()
arr[0] = 42
print(arr)
print(x)

y = arr.view()
arr[1] = 24
print(arr)
print(y)
# base returns None if the array owns the data.
print(x.base)
print(y.base)

#shape attribute represented in tuple - shape of an array is the number of elements in each dimension.
arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
print(arr.shape)
#array has 2 dimensions, where the first dimension has 2 elements and the second has 4
arr = np.array([1,2,3,4], ndmin = 5)
print(arr)
print('shape of array:', arr.shape)

arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
newarr = arr.reshape(4,3)
#4 arrays, 3 elements each
print(newarr)
newarr = arr.reshape(2, 3, 2)
#2 arrays containing 3 arrays each with 2 elements
print(newarr)
print(newarr.base)
#returns the original array, so it is a view.

#unknown dimension
#you do not have to specify an exact number for one of the dimensions in the reshape method
newarr = arr.reshape(2, 2, -1)
print(newarr)
# flattening arrays
arr = np.array([[1, 2, 3], [4, 5, 6]])
newarr = arr.reshape(-1)
print(newarr)
#flatten, ravel, rot90, flip, fliplr, flipud


