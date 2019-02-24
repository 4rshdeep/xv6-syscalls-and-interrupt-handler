#include "types.h"
#include "stat.h"
#include "user.h"

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
	float variance = 0.0;

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


	int child_id = getpid();
	int num_part = size/num_procs;
	


	// calculate sums and send to the reciever
	for (int i = 0; i < num_procs; i++) {
		int pid = fork();
		if (pid == 0)
		{
		
			int start =  i*num_part;
			int end   = (i+1)*num_part;
			int tot=0;

			for (int j = start; j < end; j++) {
				tot += arr[j];	
			}

			send(getpid(), cur_pid, (void*) &tot);
			exit();
		}
	}

	// fetch sums and return 
	for (int i = 0; i < num_procs; ++i) {
		int value=0;
		recv((void*)&value);
		printf(1,"%d\n", value);
		tot_sum += (int)value;
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
