import random
import time

def mergeSort(arr, f, l) :
    mid = (f+l)//2
    if(f < l) :
        mergeSort(arr, f, mid)
        mergeSort(arr, mid+1, l)
        merge(arr, f, mid, l)

def merge(arr, f, mid, l) :
    k = f
    n1 = mid-f+1
    n2 = l-mid
    L = []
    R = []    
    for y in range(0, n1) :
        L.append(arr[y+f])
    
    for y in range(0, n2) :
        R.append(arr[y+mid+1])
        
    i = 0
    j = 0
    
    while i<n1 and j<n2 :
        if L[i] <= R[j] :
            arr[k] = L[i]
            i = i+1
        else :
            arr[k] = R[j]
            j = j+1
        k = k+1
    
    while i < n1 :
        arr[k] = L[i]
        i = i+1
        k = k+1
    
    while j < n2 :
        arr[k] = R[j]
        j = j+1
        k = k+1

#Main Program
n = 80000000
arr = []
for i in range(0, n) :
    arr.append(random.randint(0, 1000))

start = time.clock()
mergeSort(arr, 0, n-1)
end = time.clock()
print ("MergeSort time : " + str(end-start) + " detik")