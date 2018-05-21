import random
import time

def quickSort(arr, f, l) :
    mid = (f+l)//2
    pivot = partition(arr, f, mid, l)
    if f<l :
        quickSort(arr, f, pivot-1)
        quickSort(arr, pivot+1, l)

def partition(arr, f, mid, l) :
    i = f
    j = l
    pivot = arr[f]
    while True :
        while arr[i] < pivot :
            i = i+1
            
        while arr[j] > pivot :
            j = j-1
            
        if i<j :
            tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i = i+1
            j = j-1
            
        else :
            return j

#Main Program            
n = 80000000
arr = []
for i in range(0, n) :
    arr.append(random.randint(0, 1000))
    
start = time.clock()
quickSort(arr, 0, n-1)
end = time.clock()
print ("QuickSort time : " + str(end-start) + " detik")
