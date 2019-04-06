#include<stdio.h>
int main(){
	printf("wohaijiubuxinle\n");
	int i = getchar();
	int a = i+2;
	switch(a){
		case 0: printf("zero");break;
		case 1: printf("\none");break;
		case 2: printf("\ntwo");break;
	}
	printf("%d\n",a);
	return 0;
}