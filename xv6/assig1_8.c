#include "types.h"
#include "stat.h"
#include "user.h"

#define MSGSIZE 8
#define NUM_PROCS 4

char master_message[MSGSIZE];

void handler(){
    recv(master_message);
    return;
}

void wait_for(int t) {
    while(t>0) t--;
}

int
main(int argc, char *argv[])
{
    if(argc < 2){
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
    
    int parent_id = getpid();
    int childs[NUM_PROCS];

    for(int i=0; i<NUM_PROCS; i++){
        int id = fork();
        if(id==0){
            signal(handler);
            int start = i*size/NUM_PROCS;
            int end = (i+1)*size/NUM_PROCS;
            int sum=0;
            float var = 0.0;
            for(int j=start; j<end; j++){
                sum += arr[j];
            }

            void *msg_child = (void *)malloc(MSGSIZE);
            void *msg_child3 = (void *)malloc(MSGSIZE);
            msg_child = (void *)(&sum);
            send(getpid(),parent_id,(void*)msg_child);
            if(type==0) exit();

            sleep(getpid());
            for(int j=start; j<end; j++){
                float temp = (arr[j] - *(float*)master_message);
                var += temp*temp;

            }
            msg_child3 = (void *)(&var);
            send(getpid(),parent_id,(void*)msg_child3);
            exit();
        }
        else{
            childs[i] = id;
        }
    } 

    void *msg = (void *)malloc(MSGSIZE);
    for(int i=0; i<NUM_PROCS; i++){
        recv((void*)msg);
        tot_sum += *(int*)msg;
    }

    if (type==1) {
        wait_for(10000000);
    }

    if(type==1){
        float avg = ((float)tot_sum)/((float)size);
        void *msg_child = (void *)malloc(MSGSIZE);
        msg_child = (void *)(&avg);
        send_multi(parent_id, childs, (void*)msg_child, NUM_PROCS);
        void *m2 = (void *)malloc(MSGSIZE);
        for(int i=0; i<NUM_PROCS; i++){
            recv((void*)m2);
            variance += *(float*)m2;
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
