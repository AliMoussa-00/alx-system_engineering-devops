#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - infinite loop
 * Return: void
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - entry point
 *
 * Return: 0
 */
int main(void)
{
	pid_t child_pid;
	int i;

	i = 0;
	while (i < 5)
	{
		child_pid = fork();

		if (child_pid > 0)
		{
			printf("Zombie process created, PID: %d\n", child_pid);
			sleep(1);
			i++;
		}
		else
		{
			exit(0);
		}
	}

	infinite_while();

	return (0);
}
