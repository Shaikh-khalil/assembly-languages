#include<stdio.h>
#include<unistd.h>

int factorial(int a)
{	
	int fact=1;
	while(a>0)
	{
		fact=fact*a;
		a--;
	}
	printf("factorial is %d ",fact);
	return 0;
}

