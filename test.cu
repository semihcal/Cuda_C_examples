#include<stdio.h>
#define N 10 

int main(int argc, char** argv){
    int vec_in[N] ={6,1,7,3,2,9,10,5,4,8};

    int vec_out[N];

    int* d_vec;
    

    cudaMalloc(&d_vec, N*sizeof(int));

    cudaMemcpy(d_vec, vec_in, N*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(vec_out, d_vec, N*sizeof(int), cudaMemcpyDeviceToHost);

    printf("vec_out[3]= %d \n",vec_out[3]);

    

    return 0;
}
