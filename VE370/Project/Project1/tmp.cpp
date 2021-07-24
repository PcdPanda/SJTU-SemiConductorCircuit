#include <iostream>
#include <ctime>
#include <cstdlib>
using namespace std;
int Pass(int x) {							
	if(x>=60) return 1;						
	else return 0;						
}														
int Fail(int x) {							
	if (x<60) return 1;						
	else return 0;						
}	
int countArray(int A[], int numElements, int cntType) {					
/**********************************************************************
* Count specific elements in the integer array A[] whose size is     *
* numElements and return the following:                              *
*                                                                    *
* When cntType = 1, count the elements greater than or equal to 60;  *
* When cntType = -1, count the elements less than 60;                *
**********************************************************************/
    int i, cnt = 0;									
    for(i=numElements-1;i>0;i--) {						
		switch (cntType) {								
			case 1 : cnt += Pass(A[i]); break;			
			default: cnt += Fail(A[i]); 			
		}								
    }							
    return cnt;							
}														
main() {
	srand(time(NULL));
	int size = 31;  //determine the size of the array here
	int PassCnt, FailCnt;							
	int testArray[size];	
	for(int i=0;i<size;i++){
		testArray[i]=rand()%100;
		cout<<testArray[i]<<" ";	
	}	
	PassCnt = countArray(testArray, size, 1);						
	FailCnt = countArray(testArray, size, -1);		
	cout<<endl<<"PassCnt= "<<PassCnt<<endl<<"FailCnt= "<<FailCnt;				
}										

								

