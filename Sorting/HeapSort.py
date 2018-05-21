import random
import time

n = 40000000
heap = []
heap = heap + [-1]*(n+1)
srtd = []
root = 0
last = 0
size = 0

def left(root):
    return root*2+1

def right(root):
    return root*2+2
    
def parent(root):
    return (root-1)/2
    
def insert(data):
    global last
    global size
    heap[last] = data
    shiftUp(last)
    last = last+1
    size = size+1

def swap(i, j):
    tmp = heap[i]
    heap[i] = heap[j]
    heap[j] = tmp
    
def shiftUp(pos):
    while heap[pos] > heap[parent(pos)]:
        swap(pos, parent(pos))
        pos = parent(pos)
        
def shiftDown(pos):
    bigger = 0
    if right(pos) <= last and heap[right(pos)] > heap[left(pos)]:
        bigger = right(pos)
    else:
        bigger = left(pos)
        
    if bigger <= last and heap[pos] < heap[bigger]:
        swap(bigger, pos)
        pos = bigger
        shiftDown(pos)
        
def deleteRoot():
    global root
    tmp = heap[root]
    delete(root)
    return tmp
    
def delete(pos):
    global last
    global size
    heap[pos] = heap[last]
    heap[last] = -1
    last = last-1
    shiftUp(pos)
    shiftDown(pos)
    size = size-1
    
def HeapSort():
    while last != 0:
        gg = deleteRoot()
        srtd.append(gg)


for i in range(0, n):
    ins = random.randint(0, 1000)
    insert(ins)

start = time.clock()
HeapSort()
end = time.clock()
print ("MergeSort time : " + str(end-start) + " detik")    