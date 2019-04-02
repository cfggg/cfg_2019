#include<stdio.h>
void f2(){
	if(1)
		printf("hello,world\n");
}
void f1(int i){
	printf("wohaijiubuxinle\n");
	switch(i){
		case 0: printf("zero");break;
		case 1: printf("\none");break;
		case 2: printf("\ntwo");break;
	}
}

int main(){
	int i = getchar();
	switch(i){
		case 0: printf("zero");break;
		case 1: printf("\none");break;
		case 2: printf("\ntwo");break;
		case 3: printf("\nthree");break;
		case 4: printf("\nfour");break;
		case 5: printf("\nfive");break;
		default:printf("default");
	}
	f2();
	char a = getchar();
	switch(a){
		case 'a': printf("zero");break;
		case 'b': printf("\none");break;
		case 'c': printf("\ntwo");
		case 'd': printf("\nthree");break;
		default:printf("default");
	}
	printf("bye\n");
	return 0;
}
