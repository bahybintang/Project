#include <bits/stdc++.h>
using namespace std;

void merge(long x[], int f, int mid, int l){
    int k = f;
    int n1 = mid-f+1, n2 = l-mid;

    long *L = new long[n1];
    long *R = new long [n2];

    for(int y = 0; y < n1; y++){
        L[y] = x[y+f];
    }

    for(int y = 0; y < n2; y++){
        R[y] = x[y+mid+1];
    }

    int i = 0, j = 0;

    while(i < n1 && j < n2){
        if(L[i] <= R[j]){
            x[k] = L[i];
            i++;
        }
        else{
            x[k] = R[j];
            j++;
        }
        k++;
    }

    while(i < n1){
        x[k] = L[i];
        i++;
        k++;
    }

    while(j < n2){
        x[k] = R[j];
        j++;
        k++;
    }

    delete[]L;
    delete[]R;
}

void mergeSort(long x[], int f, int l){
    int mid = (f+l)/2;
    if(f < l){
        mergeSort(x, f, mid);
        mergeSort(x, mid+1, l);
        merge(x, f, mid, l);
    }
}

int partisiLomuto(long x[], int f, int l){ //Lebih lambat
    long pivot = x[(f+l)/2];
    int i = f-1;
    for(int j = f; j < l; j++){
        if(x[j] < pivot){
            i++;
            long tmp = x[j];
            x[j] = x[i];
            x[i] = tmp;
        }
    }
    long tmp = x[i+1];
    x[i+1] = x[l];
    x[l] = tmp;
    return i+1;
}

int partisiHoare(long x[], int f, int l){ //Fast gan
    long pivot = x[f];
    int i = f-1;
    int j = l+1;
    while(true){
        do{
            i++;
        }while(x[i] < pivot);

        do{
            j--;
        }while(x[j] > pivot);

        if(i<j){
            long tmp = x[i];
            x[i] = x[j];
                x[j] = tmp;
        }

        else return j;
    }
}

void quickSort(long x[], int f, int l){
    if(f < l){
        int pivot = partisiHoare(x, f, l);
        quickSort(x, f, pivot-1);
        quickSort(x, pivot+1, l);
    }
}

int main(){
    long n = 5;
    long *arr1 = new long[n];
    long *arr = new long[n];
    for(int i = 0; i<n; i++){
        int rnd = rand() % 1000000000 + 1;
        arr[i] = rnd;
        arr1[i] = rnd;
    }

    double start = clock();
    quickSort(arr1, 0, n-1);
    cout << "Waktu QuickSort : " << fixed << double(clock()-start)/CLOCKS_PER_SEC << " detik" << endl;

    start = clock();
    mergeSort(arr, 0, n-1);
    cout << "Waktu MergeSort : " << fixed << double(clock()-start)/CLOCKS_PER_SEC << " detik" << endl;
}
