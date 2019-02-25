#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8
int here;
int mean;

void foo(void){
	printf(1, "EVENT HANDLER\n");
	printf(1,"Mean : %d\n", mean);
	here = 2;
}

int main(void)
{
	here = 1;
	printf(1,"%s\n","IPC Test case");
	// ps();
	int cid = fork();
	mean = 0;
	if(cid==0){
		// This is child
		signal(foo);
		while(1){ };

		printf(1,"%d: \n", mean);
		exit();
	}else{
		// This is parent
		mean = 10;
		char *msg_child = (char *)malloc(MSGSIZE);
		msg_child = "P";
		// ps();
 		int pids[] = { cid }; 
		
		
		send_multi(getpid(), pids, msg_child, 1);	
		printf(1,"1 PARENT: %s\n", msg_child );
		
		free(msg_child);
		wait();
	}
	printf(1,"Process is ending\n");
	exit();
}