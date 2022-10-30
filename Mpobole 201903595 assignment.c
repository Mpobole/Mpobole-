#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool Isprime(int);
int Reverse(int);

int main()
{
	int num, count = 0;
	while(count <10)
	{
		if(Isprime(num))
		{
		    int num1 = pow(num,2);
		    int num2 = Reverse(num1);
		    int num4 = Reverse(num);
		    int num3 = pow(num4, 2);
						
			if(num3 == num2 && num != num4)
			{
				printf("%d\n",num1);                         
			    count++;
			}
		}
		num++;
	}
}

bool Isprime(int num)
{ 
	if(num < 2)
		return false; 
  	
	for(int i = 2; i <= num/2; i++)
	{
		if(num < 2 || num % i == 0)
		{ 
			return false;
		}
	}
	return true;
}

int Reverse(int num)
{
	int reversed_num = 0;
	while (num != 0)
	{
		reversed_num = reversed_num * 10;
		reversed_num = reversed_num + num % 10;
		num = num / 10;
	}
	return reversed_num;
}