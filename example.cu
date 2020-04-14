#include <string.h>
#include <stdio.h>
#define N 10

__global__ void kernel(int* d_vec, int n) {

    int tid = threadIdx.x;

    if(threadIdx.x < n) {
        int i = d_vec[tid];
        d_vec[tid] = i > 5 ? -i : i;
    }
}

int main(int argc, char** argv){

    cudaMemcpy(d_msg, msg_in, N*sizeof(int), cudaMemcpyHostToDevice);
    kernel<<<1,100>>>(d_msg, N);
    cudaMemcpy(msg_out, d_msg, N*sizeof(int), cudaMemcpyDeviceToHost);
    
}
