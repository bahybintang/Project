#include <bits/stdc++.h>
using namespace std;

long *heap, *sorted;
int root, last, size;

    int left(int root){
        return root*2+1;
    }

    int right(int root){
        return root*2+2;
    }

    int parent(int root){
        return (root-1)/2;
    }

    void shiftUp(int tmp){
        while(heap[tmp] > heap[parent(tmp)]){
            swap(heap[tmp], heap[parent(tmp)]);
            tmp = parent(tmp);
        }
    }

    void insert(long data){
        heap[last] = data;
        shiftUp(last);
        last++;
        size++;
    }

    void shiftDown(int tmp){
        int bigger;
        if(right(tmp) <= last && heap[right(tmp)] > heap[left(tmp)]){
            bigger = right(tmp);
        }
        else bigger = left(tmp);

        if(bigger <= last && heap[tmp] < heap[bigger]){
            swap(heap[tmp], heap[bigger]);
            tmp = bigger;
            shiftDown(tmp);
        }
    }

    void dlt(int pos){
        heap[pos] = heap[last];
        last--;
        heap[last+1] = -1;
        shiftUp(pos);
        shiftDown(pos);
        size--;
    }

    long deleteRoot(){
        long tmp = heap[root];
        dlt(root);
        return tmp;
    }

    void sort(){
        int idx = 0;
        while(last != 0){
            long gg = deleteRoot();
            //System.out.println(gg + " ");
            sorted[idx] = gg;
            idx++;
        }
    }

int main(){
    int n = 160000000;
    heap = new long[n+1000];
    sorted = new long[n+100];
    root = last = size = 0;
    for (int i = 0; i < n; i++) {
        insert(rand()*1000000000+1);
    }

    double start = clock();
    sort();
    cout << "Waktu HeapSort : " << fixed << double(clock()-start)/CLOCKS_PER_SEC << " detik" << endl;

}
