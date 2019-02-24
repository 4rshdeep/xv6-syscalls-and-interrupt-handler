#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8

int main(void)
{

	// Check the inputs to the function 
	// char *msg_child = (char *)malloc(MSGSIZE);
	// msg_child = "P";
 	// int arr[] = { 3, 5, 6, 7, 9 }; 
	// send_multi(100,arr,msg_child, 5);	
	// free(msg_child);

	// printf(1,"%s\n","IPC Test case");
	// int cid = fork();
	// if(cid==0){
	// 	// This is child
	// 	char *msg = (char *)malloc(MSGSIZE);
	// 	int stat=-1;
	// 	while(stat==-1){
	// 		stat = recv(msg);
	// 	}
	// 	printf(1,"2 CHILD: msg recv is: %s \n", msg );
	// 	exit();
	// }else{
	// 	// This is parent
	// 	char *msg_child = (char *)malloc(MSGSIZE);
	// 	msg_child = "P";
	// 	send(getpid(),cid,msg_child);	
	// 	printf(1,"1 PARENT: msg sent is: %s \n", msg_child );
	// 	free(msg_child);
	// }
	exit();
}
