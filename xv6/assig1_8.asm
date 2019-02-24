
_assig1_8:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	return;
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp
	if(argc< 2){
  14:	83 39 01             	cmpl   $0x1,(%ecx)
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	if(argc< 2){
  1a:	0f 8e e6 00 00 00    	jle    106 <main+0x106>
		printf(1,"Need type and input filename\n");
		exit();
	}
	char *filename;
	filename=argv[2];
  20:	8b 78 08             	mov    0x8(%eax),%edi
	int type = atoi(argv[1]);
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	ff 70 04             	pushl  0x4(%eax)
	filename=argv[2];
  29:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	int type = atoi(argv[1]);
  2c:	e8 3f 04 00 00       	call   470 <atoi>
	printf(1,"Type is %d and filename is %s\n",type, filename);
  31:	57                   	push   %edi
  32:	50                   	push   %eax
  33:	68 ec 09 00 00       	push   $0x9ec
  38:	6a 01                	push   $0x1
	int type = atoi(argv[1]);
  3a:	89 45 c8             	mov    %eax,-0x38(%ebp)
	printf(1,"Type is %d and filename is %s\n",type, filename);
  3d:	e8 2e 06 00 00       	call   670 <printf>
	int tot_sum = 0;	
	int child[num_proc];
	float variance = 0.0;
	int size=1000;
	short arr[size];
  42:	81 ec c0 07 00 00    	sub    $0x7c0,%esp
  48:	89 e3                	mov    %esp,%ebx
	char c;
	int fd = open(filename, 0);
  4a:	50                   	push   %eax
  4b:	50                   	push   %eax
  4c:	6a 00                	push   $0x0
  4e:	57                   	push   %edi
  4f:	8d 7d db             	lea    -0x25(%ebp),%edi
	short arr[size];
  52:	89 5d c0             	mov    %ebx,-0x40(%ebp)
	int fd = open(filename, 0);
  55:	e8 c8 04 00 00       	call   522 <open>
  5a:	89 c6                	mov    %eax,%esi
  5c:	8d 83 d0 07 00 00    	lea    0x7d0(%ebx),%eax
  62:	89 5d bc             	mov    %ebx,-0x44(%ebp)
  65:	83 c4 10             	add    $0x10,%esp
  68:	89 45 cc             	mov    %eax,-0x34(%ebp)
  6b:	90                   	nop
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for(int i=0; i<size; i++){
		read(fd, &c, 1);
  70:	83 ec 04             	sub    $0x4,%esp
  73:	83 c3 02             	add    $0x2,%ebx
  76:	6a 01                	push   $0x1
  78:	57                   	push   %edi
  79:	56                   	push   %esi
  7a:	e8 7b 04 00 00       	call   4fa <read>
		arr[i]=c-'0';
  7f:	66 0f be 45 db       	movsbw -0x25(%ebp),%ax
		read(fd, &c, 1);
  84:	83 c4 0c             	add    $0xc,%esp
		arr[i]=c-'0';
  87:	83 e8 30             	sub    $0x30,%eax
  8a:	66 89 43 fe          	mov    %ax,-0x2(%ebx)
		read(fd, &c, 1);
  8e:	6a 01                	push   $0x1
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	e8 63 04 00 00       	call   4fa <read>
	for(int i=0; i<size; i++){
  97:	83 c4 10             	add    $0x10,%esp
  9a:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
  9d:	75 d1                	jne    70 <main+0x70>
	}	
  	close(fd);
  9f:	83 ec 0c             	sub    $0xc,%esp
  a2:	56                   	push   %esi
  a3:	e8 62 04 00 00       	call   50a <close>
  	int par = getpid();
  a8:	e8 b5 04 00 00       	call   562 <getpid>
  ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
  	int cid;
  	int mean;
  	int block = size/num_proc;
	for(int i=0;i<num_proc;i++){
		cid = fork();
  b0:	e8 25 04 00 00       	call   4da <fork>
		if(cid==0){
  b5:	83 c4 10             	add    $0x10,%esp
  b8:	85 c0                	test   %eax,%eax
		cid = fork();
  ba:	89 c7                	mov    %eax,%edi
		if(cid==0){
  bc:	0f 84 d5 00 00 00    	je     197 <main+0x197>
			}
		}
		else child[i] = cid;
	}
	for(int i=0;i<num_proc;i++){
		char *msg = (char *)malloc(MSGSIZE);
  c2:	83 ec 0c             	sub    $0xc,%esp
		else child[i] = cid;
  c5:	89 45 dc             	mov    %eax,-0x24(%ebp)
		char *msg = (char *)malloc(MSGSIZE);
  c8:	6a 08                	push   $0x8
  ca:	e8 01 08 00 00       	call   8d0 <malloc>
  cf:	89 c3                	mov    %eax,%ebx
		recv(msg);
  d1:	89 04 24             	mov    %eax,(%esp)
  d4:	e8 d1 04 00 00       	call   5aa <recv>
		tot_sum += *(int*)msg;
	}
	if(type==1){
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
		tot_sum += *(int*)msg;
  e0:	8b 03                	mov    (%ebx),%eax
	if(type==1){
  e2:	74 35                	je     119 <main+0x119>
			recv(msg);
			variance += *(int*)msg;
		}
	}
	variance = variance/(size*10000);
  	if(type==0){
  e4:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
  e8:	0f 85 5d 01 00 00    	jne    24b <main+0x24b>
		printf(1,"Sum of array for file %s is %d\n", filename,tot_sum);
  ee:	50                   	push   %eax
  ef:	ff 75 c4             	pushl  -0x3c(%ebp)
  f2:	68 0c 0a 00 00       	push   $0xa0c
  f7:	6a 01                	push   $0x1
  f9:	e8 72 05 00 00       	call   670 <printf>
  fe:	83 c4 10             	add    $0x10,%esp
			if(type!=1) exit();
 101:	e8 dc 03 00 00       	call   4e2 <exit>
		printf(1,"Need type and input filename\n");
 106:	52                   	push   %edx
 107:	52                   	push   %edx
 108:	68 cc 09 00 00       	push   $0x9cc
 10d:	6a 01                	push   $0x1
 10f:	e8 5c 05 00 00       	call   670 <printf>
		exit();
 114:	e8 c9 03 00 00       	call   4e2 <exit>
		mean = tot_sum/10;
 119:	b9 0a 00 00 00       	mov    $0xa,%ecx
 11e:	99                   	cltd   
		char* main_mess = (char*)malloc(MSGSIZE);
 11f:	83 ec 0c             	sub    $0xc,%esp
		mean = tot_sum/10;
 122:	f7 f9                	idiv   %ecx
		char* main_mess = (char*)malloc(MSGSIZE);
 124:	6a 08                	push   $0x8
		mean = tot_sum/10;
 126:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		char* main_mess = (char*)malloc(MSGSIZE);
 129:	e8 a2 07 00 00       	call   8d0 <malloc>
		send_multi(par,child,main_mess,num_proc);
 12e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 131:	6a 01                	push   $0x1
 133:	50                   	push   %eax
 134:	8d 45 dc             	lea    -0x24(%ebp),%eax
 137:	50                   	push   %eax
 138:	ff 75 cc             	pushl  -0x34(%ebp)
 13b:	e8 72 04 00 00       	call   5b2 <send_multi>
			char *msg = (char *)malloc(MSGSIZE);
 140:	83 c4 14             	add    $0x14,%esp
 143:	6a 08                	push   $0x8
 145:	e8 86 07 00 00       	call   8d0 <malloc>
 14a:	89 c3                	mov    %eax,%ebx
			recv(msg);
 14c:	89 04 24             	mov    %eax,(%esp)
 14f:	e8 56 04 00 00       	call   5aa <recv>
			variance += *(int*)msg;
 154:	db 03                	fildl  (%ebx)
	variance = variance/(size*10000);
 156:	83 c4 10             	add    $0x10,%esp
			variance += *(int*)msg;
 159:	d8 05 54 0a 00 00    	fadds  0xa54
	variance = variance/(size*10000);
 15f:	d8 35 58 0a 00 00    	fdivs  0xa58
	}
	else{
		printf(1,"Variance of array for file %s is %d\n", filename,(int)variance);
 165:	d9 7d d6             	fnstcw -0x2a(%ebp)
 168:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
 16c:	80 cc 0c             	or     $0xc,%ah
 16f:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
 173:	d9 6d d4             	fldcw  -0x2c(%ebp)
 176:	db 5d d0             	fistpl -0x30(%ebp)
 179:	d9 6d d6             	fldcw  -0x2a(%ebp)
 17c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 17f:	50                   	push   %eax
 180:	ff 75 c4             	pushl  -0x3c(%ebp)
 183:	68 2c 0a 00 00       	push   $0xa2c
 188:	6a 01                	push   $0x1
 18a:	e8 e1 04 00 00       	call   670 <printf>
 18f:	83 c4 10             	add    $0x10,%esp
 192:	e9 6a ff ff ff       	jmp    101 <main+0x101>
			signal(signal_handler);
 197:	83 ec 0c             	sub    $0xc,%esp
 19a:	68 60 02 00 00       	push   $0x260
 19f:	e8 16 04 00 00       	call   5ba <signal>
 1a4:	8b 75 c0             	mov    -0x40(%ebp),%esi
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	31 c0                	xor    %eax,%eax
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			for(int j=ll;j<ul;j++) sum += arr[j];
 1b0:	0f bf 16             	movswl (%esi),%edx
 1b3:	83 c6 02             	add    $0x2,%esi
 1b6:	01 d0                	add    %edx,%eax
 1b8:	39 f3                	cmp    %esi,%ebx
 1ba:	75 f4                	jne    1b0 <main+0x1b0>
			char* message = (char*)malloc(8);
 1bc:	83 ec 0c             	sub    $0xc,%esp
 1bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
 1c2:	6a 08                	push   $0x8
 1c4:	e8 07 07 00 00       	call   8d0 <malloc>
			send(getpid(),par,message);
 1c9:	e8 94 03 00 00       	call   562 <getpid>
 1ce:	8d 55 e0             	lea    -0x20(%ebp),%edx
 1d1:	83 c4 0c             	add    $0xc,%esp
 1d4:	52                   	push   %edx
 1d5:	ff 75 cc             	pushl  -0x34(%ebp)
 1d8:	50                   	push   %eax
 1d9:	e8 c4 03 00 00       	call   5a2 <send>
			if(type!=1) exit();
 1de:	83 c4 10             	add    $0x10,%esp
 1e1:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
 1e5:	0f 85 16 ff ff ff    	jne    101 <main+0x101>
				char *locm = (char *)malloc(MSGSIZE);
 1eb:	83 ec 0c             	sub    $0xc,%esp
 1ee:	6a 08                	push   $0x8
 1f0:	e8 db 06 00 00       	call   8d0 <malloc>
				sleep(getpid());
 1f5:	e8 68 03 00 00       	call   562 <getpid>
 1fa:	89 04 24             	mov    %eax,(%esp)
 1fd:	e8 70 03 00 00       	call   572 <sleep>
				for(int j=ll;j<ul;j++) var += (arr[j]*100-*(int*)locm)*(arr[j]*100-*(int*)locm);
 202:	8b 15 40 0d 00 00    	mov    0xd40,%edx
 208:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 20b:	83 c4 10             	add    $0x10,%esp
 20e:	66 90                	xchg   %ax,%ax
 210:	0f bf 01             	movswl (%ecx),%eax
 213:	83 c1 02             	add    $0x2,%ecx
 216:	6b c0 64             	imul   $0x64,%eax,%eax
 219:	29 d0                	sub    %edx,%eax
 21b:	0f af c0             	imul   %eax,%eax
 21e:	01 c7                	add    %eax,%edi
 220:	39 f1                	cmp    %esi,%ecx
 222:	75 ec                	jne    210 <main+0x210>
				char* mess2	= (char*)malloc(MSGSIZE);
 224:	83 ec 0c             	sub    $0xc,%esp
 227:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 22a:	6a 08                	push   $0x8
 22c:	e8 9f 06 00 00       	call   8d0 <malloc>
				send(getpid(),par,mess2);
 231:	e8 2c 03 00 00       	call   562 <getpid>
 236:	8d 55 e4             	lea    -0x1c(%ebp),%edx
 239:	83 c4 0c             	add    $0xc,%esp
 23c:	52                   	push   %edx
 23d:	ff 75 cc             	pushl  -0x34(%ebp)
 240:	50                   	push   %eax
 241:	e8 5c 03 00 00       	call   5a2 <send>
				exit();
 246:	e8 97 02 00 00       	call   4e2 <exit>
	variance = variance/(size*10000);
 24b:	d9 ee                	fldz   
 24d:	e9 13 ff ff ff       	jmp    165 <main+0x165>
 252:	66 90                	xchg   %ax,%ax
 254:	66 90                	xchg   %ax,%ax
 256:	66 90                	xchg   %ax,%ax
 258:	66 90                	xchg   %ax,%ax
 25a:	66 90                	xchg   %ax,%ax
 25c:	66 90                	xchg   %ax,%ax
 25e:	66 90                	xchg   %ax,%ax

00000260 <signal_handler>:
void signal_handler(void){
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 14             	sub    $0x14,%esp
    recv(multi_mess);
 266:	68 40 0d 00 00       	push   $0xd40
 26b:	e8 3a 03 00 00       	call   5aa <recv>
    printf(1,"%d\n",*(int*)multi_mess);
 270:	83 c4 0c             	add    $0xc,%esp
 273:	ff 35 40 0d 00 00    	pushl  0xd40
 279:	68 c8 09 00 00       	push   $0x9c8
 27e:	6a 01                	push   $0x1
 280:	e8 eb 03 00 00       	call   670 <printf>
	return;
 285:	83 c4 10             	add    $0x10,%esp
}
 288:	c9                   	leave  
 289:	c3                   	ret    
 28a:	66 90                	xchg   %ax,%ax
 28c:	66 90                	xchg   %ax,%ax
 28e:	66 90                	xchg   %ax,%ax

00000290 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 29a:	89 c2                	mov    %eax,%edx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a0:	83 c1 01             	add    $0x1,%ecx
 2a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2a7:	83 c2 01             	add    $0x1,%edx
 2aa:	84 db                	test   %bl,%bl
 2ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 2af:	75 ef                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2b1:	5b                   	pop    %ebx
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2ca:	0f b6 02             	movzbl (%edx),%eax
 2cd:	0f b6 19             	movzbl (%ecx),%ebx
 2d0:	84 c0                	test   %al,%al
 2d2:	75 1c                	jne    2f0 <strcmp+0x30>
 2d4:	eb 2a                	jmp    300 <strcmp+0x40>
 2d6:	8d 76 00             	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 2e0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2e6:	83 c1 01             	add    $0x1,%ecx
 2e9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 2ec:	84 c0                	test   %al,%al
 2ee:	74 10                	je     300 <strcmp+0x40>
 2f0:	38 d8                	cmp    %bl,%al
 2f2:	74 ec                	je     2e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2f4:	29 d8                	sub    %ebx,%eax
}
 2f6:	5b                   	pop    %ebx
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 302:	29 d8                	sub    %ebx,%eax
}
 304:	5b                   	pop    %ebx
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <strlen>:

uint
strlen(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 316:	80 39 00             	cmpb   $0x0,(%ecx)
 319:	74 15                	je     330 <strlen+0x20>
 31b:	31 d2                	xor    %edx,%edx
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	83 c2 01             	add    $0x1,%edx
 323:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 327:	89 d0                	mov    %edx,%eax
 329:	75 f5                	jne    320 <strlen+0x10>
    ;
  return n;
}
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 330:	31 c0                	xor    %eax,%eax
}
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    
 334:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 33a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 347:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 d7                	mov    %edx,%edi
 34f:	fc                   	cld    
 350:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 352:	89 d0                	mov    %edx,%eax
 354:	5f                   	pop    %edi
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 36a:	0f b6 10             	movzbl (%eax),%edx
 36d:	84 d2                	test   %dl,%dl
 36f:	74 1d                	je     38e <strchr+0x2e>
    if(*s == c)
 371:	38 d3                	cmp    %dl,%bl
 373:	89 d9                	mov    %ebx,%ecx
 375:	75 0d                	jne    384 <strchr+0x24>
 377:	eb 17                	jmp    390 <strchr+0x30>
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 380:	38 ca                	cmp    %cl,%dl
 382:	74 0c                	je     390 <strchr+0x30>
  for(; *s; s++)
 384:	83 c0 01             	add    $0x1,%eax
 387:	0f b6 10             	movzbl (%eax),%edx
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strchr+0x20>
      return (char*)s;
  return 0;
 38e:	31 c0                	xor    %eax,%eax
}
 390:	5b                   	pop    %ebx
 391:	5d                   	pop    %ebp
 392:	c3                   	ret    
 393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a6:	31 f6                	xor    %esi,%esi
 3a8:	89 f3                	mov    %esi,%ebx
{
 3aa:	83 ec 1c             	sub    $0x1c,%esp
 3ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3b0:	eb 2f                	jmp    3e1 <gets+0x41>
 3b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3bb:	83 ec 04             	sub    $0x4,%esp
 3be:	6a 01                	push   $0x1
 3c0:	50                   	push   %eax
 3c1:	6a 00                	push   $0x0
 3c3:	e8 32 01 00 00       	call   4fa <read>
    if(cc < 1)
 3c8:	83 c4 10             	add    $0x10,%esp
 3cb:	85 c0                	test   %eax,%eax
 3cd:	7e 1c                	jle    3eb <gets+0x4b>
      break;
    buf[i++] = c;
 3cf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3d3:	83 c7 01             	add    $0x1,%edi
 3d6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3d9:	3c 0a                	cmp    $0xa,%al
 3db:	74 23                	je     400 <gets+0x60>
 3dd:	3c 0d                	cmp    $0xd,%al
 3df:	74 1f                	je     400 <gets+0x60>
  for(i=0; i+1 < max; ){
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	89 fe                	mov    %edi,%esi
 3e9:	7c cd                	jl     3b8 <gets+0x18>
 3eb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3f0:	c6 03 00             	movb   $0x0,(%ebx)
}
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	90                   	nop
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 400:	8b 75 08             	mov    0x8(%ebp),%esi
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	01 de                	add    %ebx,%esi
 408:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 40a:	c6 03 00             	movb   $0x0,(%ebx)
}
 40d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 410:	5b                   	pop    %ebx
 411:	5e                   	pop    %esi
 412:	5f                   	pop    %edi
 413:	5d                   	pop    %ebp
 414:	c3                   	ret    
 415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <stat>:

int
stat(const char *n, struct stat *st)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 425:	83 ec 08             	sub    $0x8,%esp
 428:	6a 00                	push   $0x0
 42a:	ff 75 08             	pushl  0x8(%ebp)
 42d:	e8 f0 00 00 00       	call   522 <open>
  if(fd < 0)
 432:	83 c4 10             	add    $0x10,%esp
 435:	85 c0                	test   %eax,%eax
 437:	78 27                	js     460 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	ff 75 0c             	pushl  0xc(%ebp)
 43f:	89 c3                	mov    %eax,%ebx
 441:	50                   	push   %eax
 442:	e8 f3 00 00 00       	call   53a <fstat>
  close(fd);
 447:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44a:	89 c6                	mov    %eax,%esi
  close(fd);
 44c:	e8 b9 00 00 00       	call   50a <close>
  return r;
 451:	83 c4 10             	add    $0x10,%esp
}
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	89 f0                	mov    %esi,%eax
 459:	5b                   	pop    %ebx
 45a:	5e                   	pop    %esi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 460:	be ff ff ff ff       	mov    $0xffffffff,%esi
 465:	eb ed                	jmp    454 <stat+0x34>
 467:	89 f6                	mov    %esi,%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <atoi>:

int
atoi(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 477:	0f be 11             	movsbl (%ecx),%edx
 47a:	8d 42 d0             	lea    -0x30(%edx),%eax
 47d:	3c 09                	cmp    $0x9,%al
  n = 0;
 47f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 484:	77 1f                	ja     4a5 <atoi+0x35>
 486:	8d 76 00             	lea    0x0(%esi),%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 490:	8d 04 80             	lea    (%eax,%eax,4),%eax
 493:	83 c1 01             	add    $0x1,%ecx
 496:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 49a:	0f be 11             	movsbl (%ecx),%edx
 49d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	5b                   	pop    %ebx
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
 4a8:	90                   	nop
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
 4b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
 4bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4be:	85 db                	test   %ebx,%ebx
 4c0:	7e 14                	jle    4d6 <memmove+0x26>
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4cf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 4d2:	39 d3                	cmp    %edx,%ebx
 4d4:	75 f2                	jne    4c8 <memmove+0x18>
  return vdst;
}
 4d6:	5b                   	pop    %ebx
 4d7:	5e                   	pop    %esi
 4d8:	5d                   	pop    %ebp
 4d9:	c3                   	ret    

000004da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4da:	b8 01 00 00 00       	mov    $0x1,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <exit>:
SYSCALL(exit)
 4e2:	b8 02 00 00 00       	mov    $0x2,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <wait>:
SYSCALL(wait)
 4ea:	b8 03 00 00 00       	mov    $0x3,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <pipe>:
SYSCALL(pipe)
 4f2:	b8 04 00 00 00       	mov    $0x4,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <read>:
SYSCALL(read)
 4fa:	b8 05 00 00 00       	mov    $0x5,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <write>:
SYSCALL(write)
 502:	b8 10 00 00 00       	mov    $0x10,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <close>:
SYSCALL(close)
 50a:	b8 15 00 00 00       	mov    $0x15,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <kill>:
SYSCALL(kill)
 512:	b8 06 00 00 00       	mov    $0x6,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <exec>:
SYSCALL(exec)
 51a:	b8 07 00 00 00       	mov    $0x7,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <open>:
SYSCALL(open)
 522:	b8 0f 00 00 00       	mov    $0xf,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <mknod>:
SYSCALL(mknod)
 52a:	b8 11 00 00 00       	mov    $0x11,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <unlink>:
SYSCALL(unlink)
 532:	b8 12 00 00 00       	mov    $0x12,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <fstat>:
SYSCALL(fstat)
 53a:	b8 08 00 00 00       	mov    $0x8,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <link>:
SYSCALL(link)
 542:	b8 13 00 00 00       	mov    $0x13,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mkdir>:
SYSCALL(mkdir)
 54a:	b8 14 00 00 00       	mov    $0x14,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <chdir>:
SYSCALL(chdir)
 552:	b8 09 00 00 00       	mov    $0x9,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <dup>:
SYSCALL(dup)
 55a:	b8 0a 00 00 00       	mov    $0xa,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <getpid>:
SYSCALL(getpid)
 562:	b8 0b 00 00 00       	mov    $0xb,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <sbrk>:
SYSCALL(sbrk)
 56a:	b8 0c 00 00 00       	mov    $0xc,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <sleep>:
SYSCALL(sleep)
 572:	b8 0d 00 00 00       	mov    $0xd,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <uptime>:
SYSCALL(uptime)
 57a:	b8 0e 00 00 00       	mov    $0xe,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <toggle>:
SYSCALL(toggle)
 582:	b8 16 00 00 00       	mov    $0x16,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <print_count>:
SYSCALL(print_count)
 58a:	b8 17 00 00 00       	mov    $0x17,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <add>:
SYSCALL(add)
 592:	b8 18 00 00 00       	mov    $0x18,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <ps>:
SYSCALL(ps)
 59a:	b8 19 00 00 00       	mov    $0x19,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <send>:
SYSCALL(send)
 5a2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <recv>:
SYSCALL(recv)
 5aa:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <send_multi>:
SYSCALL(send_multi)
 5b2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <signal>:
SYSCALL(signal)
 5ba:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    
 5c2:	66 90                	xchg   %ax,%ax
 5c4:	66 90                	xchg   %ax,%ax
 5c6:	66 90                	xchg   %ax,%ax
 5c8:	66 90                	xchg   %ax,%ax
 5ca:	66 90                	xchg   %ax,%ax
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d9:	85 d2                	test   %edx,%edx
{
 5db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 5de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 5e0:	79 76                	jns    658 <printint+0x88>
 5e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5e6:	74 70                	je     658 <printint+0x88>
    x = -xx;
 5e8:	f7 d8                	neg    %eax
    neg = 1;
 5ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f1:	31 f6                	xor    %esi,%esi
 5f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5f6:	eb 0a                	jmp    602 <printint+0x32>
 5f8:	90                   	nop
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 600:	89 fe                	mov    %edi,%esi
 602:	31 d2                	xor    %edx,%edx
 604:	8d 7e 01             	lea    0x1(%esi),%edi
 607:	f7 f1                	div    %ecx
 609:	0f b6 92 64 0a 00 00 	movzbl 0xa64(%edx),%edx
  }while((x /= base) != 0);
 610:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 612:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 615:	75 e9                	jne    600 <printint+0x30>
  if(neg)
 617:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 61a:	85 c0                	test   %eax,%eax
 61c:	74 08                	je     626 <printint+0x56>
    buf[i++] = '-';
 61e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 623:	8d 7e 02             	lea    0x2(%esi),%edi
 626:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 62a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
 636:	83 ee 01             	sub    $0x1,%esi
 639:	6a 01                	push   $0x1
 63b:	53                   	push   %ebx
 63c:	57                   	push   %edi
 63d:	88 45 d7             	mov    %al,-0x29(%ebp)
 640:	e8 bd fe ff ff       	call   502 <write>

  while(--i >= 0)
 645:	83 c4 10             	add    $0x10,%esp
 648:	39 de                	cmp    %ebx,%esi
 64a:	75 e4                	jne    630 <printint+0x60>
    putc(fd, buf[i]);
}
 64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 658:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 65f:	eb 90                	jmp    5f1 <printint+0x21>
 661:	eb 0d                	jmp    670 <printf>
 663:	90                   	nop
 664:	90                   	nop
 665:	90                   	nop
 666:	90                   	nop
 667:	90                   	nop
 668:	90                   	nop
 669:	90                   	nop
 66a:	90                   	nop
 66b:	90                   	nop
 66c:	90                   	nop
 66d:	90                   	nop
 66e:	90                   	nop
 66f:	90                   	nop

00000670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 679:	8b 75 0c             	mov    0xc(%ebp),%esi
 67c:	0f b6 1e             	movzbl (%esi),%ebx
 67f:	84 db                	test   %bl,%bl
 681:	0f 84 b3 00 00 00    	je     73a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 687:	8d 45 10             	lea    0x10(%ebp),%eax
 68a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 68d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 68f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 692:	eb 2f                	jmp    6c3 <printf+0x53>
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 698:	83 f8 25             	cmp    $0x25,%eax
 69b:	0f 84 a7 00 00 00    	je     748 <printf+0xd8>
  write(fd, &c, 1);
 6a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6a4:	83 ec 04             	sub    $0x4,%esp
 6a7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6aa:	6a 01                	push   $0x1
 6ac:	50                   	push   %eax
 6ad:	ff 75 08             	pushl  0x8(%ebp)
 6b0:	e8 4d fe ff ff       	call   502 <write>
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 6bb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6bf:	84 db                	test   %bl,%bl
 6c1:	74 77                	je     73a <printf+0xca>
    if(state == 0){
 6c3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 6c5:	0f be cb             	movsbl %bl,%ecx
 6c8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6cb:	74 cb                	je     698 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6cd:	83 ff 25             	cmp    $0x25,%edi
 6d0:	75 e6                	jne    6b8 <printf+0x48>
      if(c == 'd'){
 6d2:	83 f8 64             	cmp    $0x64,%eax
 6d5:	0f 84 05 01 00 00    	je     7e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6e1:	83 f9 70             	cmp    $0x70,%ecx
 6e4:	74 72                	je     758 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6e6:	83 f8 73             	cmp    $0x73,%eax
 6e9:	0f 84 99 00 00 00    	je     788 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ef:	83 f8 63             	cmp    $0x63,%eax
 6f2:	0f 84 08 01 00 00    	je     800 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6f8:	83 f8 25             	cmp    $0x25,%eax
 6fb:	0f 84 ef 00 00 00    	je     7f0 <printf+0x180>
  write(fd, &c, 1);
 701:	8d 45 e7             	lea    -0x19(%ebp),%eax
 704:	83 ec 04             	sub    $0x4,%esp
 707:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 70b:	6a 01                	push   $0x1
 70d:	50                   	push   %eax
 70e:	ff 75 08             	pushl  0x8(%ebp)
 711:	e8 ec fd ff ff       	call   502 <write>
 716:	83 c4 0c             	add    $0xc,%esp
 719:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 71c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 71f:	6a 01                	push   $0x1
 721:	50                   	push   %eax
 722:	ff 75 08             	pushl  0x8(%ebp)
 725:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 728:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 72a:	e8 d3 fd ff ff       	call   502 <write>
  for(i = 0; fmt[i]; i++){
 72f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 733:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 736:	84 db                	test   %bl,%bl
 738:	75 89                	jne    6c3 <printf+0x53>
    }
  }
}
 73a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73d:	5b                   	pop    %ebx
 73e:	5e                   	pop    %esi
 73f:	5f                   	pop    %edi
 740:	5d                   	pop    %ebp
 741:	c3                   	ret    
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 748:	bf 25 00 00 00       	mov    $0x25,%edi
 74d:	e9 66 ff ff ff       	jmp    6b8 <printf+0x48>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 758:	83 ec 0c             	sub    $0xc,%esp
 75b:	b9 10 00 00 00       	mov    $0x10,%ecx
 760:	6a 00                	push   $0x0
 762:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	8b 17                	mov    (%edi),%edx
 76a:	e8 61 fe ff ff       	call   5d0 <printint>
        ap++;
 76f:	89 f8                	mov    %edi,%eax
 771:	83 c4 10             	add    $0x10,%esp
      state = 0;
 774:	31 ff                	xor    %edi,%edi
        ap++;
 776:	83 c0 04             	add    $0x4,%eax
 779:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 77c:	e9 37 ff ff ff       	jmp    6b8 <printf+0x48>
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 788:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 78b:	8b 08                	mov    (%eax),%ecx
        ap++;
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 793:	85 c9                	test   %ecx,%ecx
 795:	0f 84 8e 00 00 00    	je     829 <printf+0x1b9>
        while(*s != 0){
 79b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 79e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 7a0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 7a2:	84 c0                	test   %al,%al
 7a4:	0f 84 0e ff ff ff    	je     6b8 <printf+0x48>
 7aa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7ad:	89 de                	mov    %ebx,%esi
 7af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 7b5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7b8:	83 ec 04             	sub    $0x4,%esp
          s++;
 7bb:	83 c6 01             	add    $0x1,%esi
 7be:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 7c1:	6a 01                	push   $0x1
 7c3:	57                   	push   %edi
 7c4:	53                   	push   %ebx
 7c5:	e8 38 fd ff ff       	call   502 <write>
        while(*s != 0){
 7ca:	0f b6 06             	movzbl (%esi),%eax
 7cd:	83 c4 10             	add    $0x10,%esp
 7d0:	84 c0                	test   %al,%al
 7d2:	75 e4                	jne    7b8 <printf+0x148>
 7d4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 7d7:	31 ff                	xor    %edi,%edi
 7d9:	e9 da fe ff ff       	jmp    6b8 <printf+0x48>
 7de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e8:	6a 01                	push   $0x1
 7ea:	e9 73 ff ff ff       	jmp    762 <printf+0xf2>
 7ef:	90                   	nop
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
 7f3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7f6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7f9:	6a 01                	push   $0x1
 7fb:	e9 21 ff ff ff       	jmp    721 <printf+0xb1>
        putc(fd, *ap);
 800:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 806:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 808:	6a 01                	push   $0x1
        ap++;
 80a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 80d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 810:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 813:	50                   	push   %eax
 814:	ff 75 08             	pushl  0x8(%ebp)
 817:	e8 e6 fc ff ff       	call   502 <write>
        ap++;
 81c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 81f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 822:	31 ff                	xor    %edi,%edi
 824:	e9 8f fe ff ff       	jmp    6b8 <printf+0x48>
          s = "(null)";
 829:	bb 5c 0a 00 00       	mov    $0xa5c,%ebx
        while(*s != 0){
 82e:	b8 28 00 00 00       	mov    $0x28,%eax
 833:	e9 72 ff ff ff       	jmp    7aa <printf+0x13a>
 838:	66 90                	xchg   %ax,%ax
 83a:	66 90                	xchg   %ax,%ax
 83c:	66 90                	xchg   %ax,%ax
 83e:	66 90                	xchg   %ax,%ax

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 34 0d 00 00       	mov    0xd34,%eax
{
 846:	89 e5                	mov    %esp,%ebp
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	53                   	push   %ebx
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 84e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 858:	39 c8                	cmp    %ecx,%eax
 85a:	8b 10                	mov    (%eax),%edx
 85c:	73 32                	jae    890 <free+0x50>
 85e:	39 d1                	cmp    %edx,%ecx
 860:	72 04                	jb     866 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 862:	39 d0                	cmp    %edx,%eax
 864:	72 32                	jb     898 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 866:	8b 73 fc             	mov    -0x4(%ebx),%esi
 869:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86c:	39 fa                	cmp    %edi,%edx
 86e:	74 30                	je     8a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 870:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 879:	39 f1                	cmp    %esi,%ecx
 87b:	74 3a                	je     8b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 87f:	a3 34 0d 00 00       	mov    %eax,0xd34
}
 884:	5b                   	pop    %ebx
 885:	5e                   	pop    %esi
 886:	5f                   	pop    %edi
 887:	5d                   	pop    %ebp
 888:	c3                   	ret    
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 890:	39 d0                	cmp    %edx,%eax
 892:	72 04                	jb     898 <free+0x58>
 894:	39 d1                	cmp    %edx,%ecx
 896:	72 ce                	jb     866 <free+0x26>
{
 898:	89 d0                	mov    %edx,%eax
 89a:	eb bc                	jmp    858 <free+0x18>
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8a0:	03 72 04             	add    0x4(%edx),%esi
 8a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a6:	8b 10                	mov    (%eax),%edx
 8a8:	8b 12                	mov    (%edx),%edx
 8aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b3:	39 f1                	cmp    %esi,%ecx
 8b5:	75 c6                	jne    87d <free+0x3d>
    p->s.size += bp->s.size;
 8b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ba:	a3 34 0d 00 00       	mov    %eax,0xd34
    p->s.size += bp->s.size;
 8bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8c5:	89 10                	mov    %edx,(%eax)
}
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8dc:	8b 15 34 0d 00 00    	mov    0xd34,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8d 78 07             	lea    0x7(%eax),%edi
 8e5:	c1 ef 03             	shr    $0x3,%edi
 8e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8eb:	85 d2                	test   %edx,%edx
 8ed:	0f 84 9d 00 00 00    	je     990 <malloc+0xc0>
 8f3:	8b 02                	mov    (%edx),%eax
 8f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8f8:	39 cf                	cmp    %ecx,%edi
 8fa:	76 6c                	jbe    968 <malloc+0x98>
 8fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 902:	bb 00 10 00 00       	mov    $0x1000,%ebx
 907:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 90a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 911:	eb 0e                	jmp    921 <malloc+0x51>
 913:	90                   	nop
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 918:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 91a:	8b 48 04             	mov    0x4(%eax),%ecx
 91d:	39 f9                	cmp    %edi,%ecx
 91f:	73 47                	jae    968 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 921:	39 05 34 0d 00 00    	cmp    %eax,0xd34
 927:	89 c2                	mov    %eax,%edx
 929:	75 ed                	jne    918 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	56                   	push   %esi
 92f:	e8 36 fc ff ff       	call   56a <sbrk>
  if(p == (char*)-1)
 934:	83 c4 10             	add    $0x10,%esp
 937:	83 f8 ff             	cmp    $0xffffffff,%eax
 93a:	74 1c                	je     958 <malloc+0x88>
  hp->s.size = nu;
 93c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93f:	83 ec 0c             	sub    $0xc,%esp
 942:	83 c0 08             	add    $0x8,%eax
 945:	50                   	push   %eax
 946:	e8 f5 fe ff ff       	call   840 <free>
  return freep;
 94b:	8b 15 34 0d 00 00    	mov    0xd34,%edx
      if((p = morecore(nunits)) == 0)
 951:	83 c4 10             	add    $0x10,%esp
 954:	85 d2                	test   %edx,%edx
 956:	75 c0                	jne    918 <malloc+0x48>
        return 0;
  }
}
 958:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 95b:	31 c0                	xor    %eax,%eax
}
 95d:	5b                   	pop    %ebx
 95e:	5e                   	pop    %esi
 95f:	5f                   	pop    %edi
 960:	5d                   	pop    %ebp
 961:	c3                   	ret    
 962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 968:	39 cf                	cmp    %ecx,%edi
 96a:	74 54                	je     9c0 <malloc+0xf0>
        p->s.size -= nunits;
 96c:	29 f9                	sub    %edi,%ecx
 96e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 971:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 974:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 977:	89 15 34 0d 00 00    	mov    %edx,0xd34
}
 97d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 980:	83 c0 08             	add    $0x8,%eax
}
 983:	5b                   	pop    %ebx
 984:	5e                   	pop    %esi
 985:	5f                   	pop    %edi
 986:	5d                   	pop    %ebp
 987:	c3                   	ret    
 988:	90                   	nop
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 990:	c7 05 34 0d 00 00 38 	movl   $0xd38,0xd34
 997:	0d 00 00 
 99a:	c7 05 38 0d 00 00 38 	movl   $0xd38,0xd38
 9a1:	0d 00 00 
    base.s.size = 0;
 9a4:	b8 38 0d 00 00       	mov    $0xd38,%eax
 9a9:	c7 05 3c 0d 00 00 00 	movl   $0x0,0xd3c
 9b0:	00 00 00 
 9b3:	e9 44 ff ff ff       	jmp    8fc <malloc+0x2c>
 9b8:	90                   	nop
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 08                	mov    (%eax),%ecx
 9c2:	89 0a                	mov    %ecx,(%edx)
 9c4:	eb b1                	jmp    977 <malloc+0xa7>
