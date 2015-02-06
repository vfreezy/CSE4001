#include <unistd.h>

int main()
{
	char DV[] = "THIS IS PRINTED CHAR BY CHAR WITH PRINTC(CHAR)\n";
	int length = sizeof(DV) / sizeof(char);	

	hello();

	for (int x = 0; x < length; x++)
	{
		printc(DV[x]);
	}
	return 0;
}
