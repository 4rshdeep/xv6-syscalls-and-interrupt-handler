#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8

char my_message[MSGSIZE];

void handle_message(){
	recv(my_message);
	printf(1,"%d\n",*(int*)my_message);
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
  	int num_threads = 4;

  	
  	int cid[num_threads];
  	int temp;
  	int sum[num_threads];
  	float sum2[num_threads];
  	int parent_id = getpid();

  	for(int i=0; i<num_threads; i++){
  		temp = fork();
  		if(temp==0){
  			signal(handle_message);
  			sum[i]=0;
  			sum2[i]=0.0;
  			for(int j=i*size/num_threads; j<(i+1)*size/num_threads; j++){
  				sum[i] += arr[j];
  			}
  			void *msg_child = (void *)malloc(8);
  			void *msg_child3 = (void *)malloc(8);
			msg_child = (void *)(&sum[i]);
			send(getpid(),parent_id,(void*)msg_child);
			if(type==0) exit();
			sleep(getpid());

  			for(int j=i*size/num_threads; j<(i+1)*size/num_threads; j++){
  				sum2[i] = sum2[i] + (arr[j] - *(float*)my_message)*(arr[j] - *(float*)my_message);
  			}
  			printf(1, "total sum calculated for variance is %d\n", sum2[0]);
  			msg_child3 = (void *)(&sum2[i]);
  			send(getpid(),parent_id,(void*)msg_child3);
			exit();
  		}
  		else{
  			cid[i] = temp;
  		}
  	} 

	void *msg = (void *)malloc(8);
	void *msg2 = (void *)malloc(8);
	for(int i=0; i<num_threads; i++){
		recv((void*)msg);
		int *ss = (int*)msg;
		tot_sum += *ss;
	}
	if(type==1){
		int iii=10000000;
		while(iii>0){
			iii--;
		}
		float avg = ((float)tot_sum)/((float)size);
		// float avg = tot_sum/size;
		void *msg_child = (void *)malloc(8);
		msg_child = (void *)(&avg);
		send_multi(parent_id, cid, (void*)msg_child, num_threads);

		for(int i=0; i<num_threads; i++){
			recv((void*)msg2);
			// float *ss = (float*)msg;
			float *sss = (float*)msg2;
			printf(1, "the received sum for variance is %d\n", *sss);
			variance += *sss;
		}
		variance = variance/(float)size;
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
