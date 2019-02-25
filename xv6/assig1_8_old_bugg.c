#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8

char multi_message[MSGSIZE];

void handler(void) {
	printf(1, "djhfg\n");
	recv(multi_message);
	printf(1, "%d\n", *(int*) multi_message);
	return;
}


int
main(int argc, char *argv[])
{
	if(argc< 2){
		printf(1,"Need type and input filename\n");
		exit();
	}
	char *filename;
	filename=argv[2];
	int type = atoi(argv[1]);
	printf(1,"Type is %d and filename is %s\n",type, filename);

	int tot_sum = 0;	
	int variance = 0.0;

	int size=1000;
	short arr[size];
	char c;
	int fd = open(filename, 0);
	for(int i=0; i<size; i++){
		read(fd, &c, 1);
		arr[i]=c-'0';
		read(fd, &c, 1);
	}	
  	close(fd);
  	// this is to supress warning
  	printf(1,"first elem %d\n", arr[0]);
  
  	//----FILL THE CODE HERE for unicast sum and multicast variance

	int num_procs = 1;
	int parent_id = getpid();
	// int num_part = size/num_procs;
	int child_id[num_procs];

	// calculate sums and send to the reciever
	for (int i = 0; i < num_procs; i++) {
		int pid = fork();
		if (pid == 0) {
			signal(handler);
			// int start =  i*num_part;
			// int end   = (i+1)*num_part;
			// if (i==num_procs-1) {
				// end = size;
			// }
			int tot=0;
			for (int j = i*size/num_procs; j < (i+1)*size/num_procs; j++) {
				tot += arr[j];	
			}
			send(getpid(), parent_id, (void*) &tot);
			
			if (type!=1) {
				exit();
			}
			else {
				void *message = (void *) malloc(MSGSIZE);
				sleep(getpid());
				message = (void*)multi_message;
				int v = 0;
				int temp = 0;
			for (int j = i*size/num_procs; j < (i+1)*size/num_procs; j++) {
				// for (int j=start; j<end; j++) {
					temp = (arr[j]-*(int*)message);
					v += temp*temp;
				}
				void* msg = (void*) malloc(MSGSIZE);
				msg = (void*)&v;
				send(getpid(), parent_id, msg);
				exit();
			}
		}
		else { child_id[i]=pid; }
	}

	// fetch sums and return 
	for (int i = 0; i < num_procs; ++i) {
		int value=0;
		recv((void*)&value);
		printf(1,"%d\n", value);
		tot_sum += (int)value;
	}
	if (type==1)
	{
		void* temp = (void*) malloc(8);
		int wait = 20000;
		while(wait>0) {
			wait--;
		}
		int avg = ((int)tot_sum)/((int)size);
		printf(1, "agsf%d\n", avg);
		void *msg_child = ((void*)malloc(8));
		msg_child = (void*) (&avg);
		send_multi(parent_id, child_id, ((void*)msg_child), num_procs);

		for (int i = 0; i < num_procs; ++i)
		{
			recv((void*) temp);
			int* temp2 = (int*)temp;
			variance += *temp2;
		}

		variance = variance/(int)size;

	}

  	//------------------

  	if(type==0){ //unicast sum
		printf(1,"Sum of array for file %s is %d\n", filename,tot_sum);
	}
	else{ //mulicast variance
		printf(1,"Variance of array for file %s is %d\n", filename,(int)variance);
	}
	exit();
}
