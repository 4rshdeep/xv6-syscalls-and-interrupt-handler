#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

extern int show_trace;
extern void clear_logs();
extern void print_logs();
extern void print_running();
extern int sending(int, int, char*);
extern int recieving(char*);

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

////////////////////////////////////////////////
/// assignment code /// 
///////////////////////////////////////////////

int
sys_toggle(void)
{
  show_trace = 1- show_trace;
  if (show_trace == 1) {
    cprintf("TRACE_ON \n");
    clear_logs();
  }
  else {
    cprintf("TRACE_OFF \n");
  }
  return 0;
}

int
sys_print_count(void) 
{
  print_logs();
  return 0;
}

int
sys_add(void)
{
  int i1;
  argint(0, &i1);
  int i2; 
  argint(1, &i2);
  int i = i1+i2;
  cprintf("%d\n",i);
  return i;
}

int 
sys_ps(void) 
{
  print_running();
  return 0; 
}

int 
sys_send(void)
{
  int send_pid, recv_pid;
  char* msg;

  if(argint(0, &send_pid) < 0)
    return -1;

  if(argint(1, &recv_pid) < 0)
    return -1;

  if (argptr(2, &msg, sizeof(char*)) < 0) {
    return -1;
  }

  int answer = sending(send_pid, recv_pid, msg);
  return answer;
}

int
sys_recv(void)
{
  char *msg;

  if (argptr(0, &msg, sizeof(char*)) < 0) {
    return -1;
  }

  int answer = recieving(msg);
  
  return answer;
}

int 
sys_send_multi(void)
{ 
  int send_pid;
  int *recv_pid;
  char *msg;
  int length;
  if(argint(0, &send_pid) < 0)
    return -1;

  if(argptr(1, (void *)&recv_pid, sizeof(int*)) < 0)
    return -1;

  if (argptr(2, &msg, sizeof(char*)) < 0) {
    return -1;
  }

  if (argint(3, &length) < 0) {
    return -1;
  }

  recv_pid = (int*) recv_pid;

  cprintf("multicast called with args : \n");
  cprintf("sender_pid : %d\n", send_pid);
  cprintf("length : %d\n", length);

  for(int i=0; i<length; i = (i+1) ) 
    cprintf("recv_pid   : %d\n", (int)recv_pid[i]);

  cprintf("message is  : %s\n", msg);

  return 1;
}