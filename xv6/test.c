#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8
int here;
void foo(void){
	printf(1,"Hello Rajas is my name\n");
	here = 2;
}

int main(void)
{
	here = 1;
	printf(1,"%s\n","IPC Test case");
	// ps();
	int cid = fork();
	if(cid==0){
		// This is child
		signal(foo);
		while(here == 1){
			printf(1,"Ok Jayant, Please fuck off\n");
		};
		printf(1,"2 CHILD: \n");
		exit();
	}else{
		// This is parent
		char *msg_child = (char *)malloc(MSGSIZE);
		msg_child = "P";
		// ps();
		int * pids = malloc(2*sizeof(int));
		*pids = cid;
		// pids++;
		// *pids = -1;
		// pids--;
		send_multi(getpid(),pids,msg_child, 1);	
		printf(1,"1 PARENT: %s\n", msg_child );
		free(msg_child);
		wait();
	}
	printf(1,"Process is ending\n");
	exit();
}