#include <stdio.h>
#include <stdlib.h>
#define MAXBITS 100
int main() / input of the user
int inputNumber; / for the remainder
int re;
// contains the bits 0/1
int bits[MAXBITS];
// for the loops
int j;
int i = 0;
I reads a decimal number from the user.
printf("Enter a positive integer number: ");
scanf ("%d", &inputNumber); I make sure the input number is a positive integer.
if (inputNumber < 0)
printf(" only positive integers >= 0\n");
return 1;
}
// actual processing
while (inputNumber > 0)
// computes the remainder by modulo 2
re = inputNumber % 2;
/ computes the quotient of division by 2
inputNumber = inputNumber / 2;
bits[i] = re;
i++；
}
printf("The number in binary is: ");
// iterates backwards over all bits
for (j = i - 1; j >= 0; j--)
printf("%d", bits[j]);
}
/l for the case the input number is 0
if (i == 0)
printf("0");
子
return 0;
// https://www.web4.si.net/2026/06/convert-decimal-to-binary-in-c.html
