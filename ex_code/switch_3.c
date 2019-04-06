#include<stdio.h>
int main(){
	int c = getchar();
	int b = getchar();
	switch(c){
		case 0:printf("0\n");break;
		case 1:
		switch(b){
			case 0: printf("zero");break;
			case 1: printf("\none");break;
			case 2: printf("\ntwo");break;
			case 3: printf("a");break;
			case 4: printf("b");break;
			case 8: printf("c");break;
		}break;
		case 2:
		printf("2\n");break;
		case 3:
		printf("3\n");break;
		case 4:
		printf("4\n");break;
		case 5:
		printf("5\n");break;
		default:printf("default\n");
	}	
	return 0;
}
