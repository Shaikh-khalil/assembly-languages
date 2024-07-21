#include<stdio.h>
#include<unistd.h>

int table(int a)
{
	int b=1,mul;
	while(b<=10)
	{
		mul = a*b;
		printf("%d\n",mul);
		b++;
	}
	return 0;
}
