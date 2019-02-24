#include "types.h"
#include "stat.h"
#include "user.h"
#define num_proc 1
#define MSGSIZE 8

char multi_mess[MSGSIZE];

void signal_handler(void){
    recv(multi_mess);
    printf(1,"%d\n",*(int*)multi_mess);
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
	int child[num_proc];
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
  	int par = getpid();
  	int cid;
  	int mean;
  	int block = size/num_proc;
	for(int i=0;i<num_proc;i++){
		cid = fork();
		if(cid==0){
			signal(signal_handler);
			int ll = i*block;
			int ul = (i+1)*block;
			if(i==num_proc-1) ul = size;
			int sum =0;
			for(int j=ll;j<ul;j++) sum += arr[j];
			char* message = (char*)malloc(8);
			message = (char*)&sum;
			send(getpid(),par,message);
			if(type!=1) exit();
			else{
				char *locm = (char *)malloc(MSGSIZE);
				sleep(getpid());
				locm = multi_mess;
				int var = 0;
				for(int j=ll;j<ul;j++) var += (arr[j]*100-*(int*)locm)*(arr[j]*100-*(int*)locm);
				char* mess2	= (char*)malloc(MSGSIZE);
				mess2 = (char*)&var;
				send(getpid(),par,mess2);
				exit();
			}
		}
		else child[i] = cid;
	}
	for(int i=0;i<num_proc;i++){
		char *msg = (char *)malloc(MSGSIZE);
		recv(msg);
		tot_sum += *(int*)msg;
	}
	if(type==1){
		mean = tot_sum/10;
		char* main_mess = (char*)malloc(MSGSIZE);
		main_mess = (char*)&mean;
		send_multi(par,child,main_mess,num_proc);
		for(int i=0;i<num_proc;i++){
			char *msg = (char *)malloc(MSGSIZE);
			recv(msg);
			variance += *(int*)msg;
		}
	}
	variance = variance/(size*10000);
  	if(type==0){
		printf(1,"Sum of array for file %s is %d\n", filename,tot_sum);
	}
	else{
		printf(1,"Variance of array for file %s is %d\n", filename,(int)variance);
	}
	exit();
}
