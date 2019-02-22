
_assig1_8:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  11:	83 ec 28             	sub    $0x28,%esp
	if(argc< 2){
  14:	83 39 01             	cmpl   $0x1,(%ecx)
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	if(argc< 2){
  1a:	0f 8e 47 01 00 00    	jle    167 <main+0x167>
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
  29:	89 7d c8             	mov    %edi,-0x38(%ebp)
	int type = atoi(argv[1]);
  2c:	e8 7f 03 00 00       	call   3b0 <atoi>
	printf(1,"Type is %d and filename is %s\n",type, filename);
  31:	57                   	push   %edi
  32:	50                   	push   %eax
  33:	68 28 09 00 00       	push   $0x928
  38:	6a 01                	push   $0x1
	int type = atoi(argv[1]);
  3a:	89 45 cc             	mov    %eax,-0x34(%ebp)
	printf(1,"Type is %d and filename is %s\n",type, filename);
  3d:	e8 5e 05 00 00       	call   5a0 <printf>

	int tot_sum = 0;	
	float variance = 0.0;

	int size=1000;
	short arr[size];
  42:	81 ec c0 07 00 00    	sub    $0x7c0,%esp
  48:	89 e3                	mov    %esp,%ebx
	char c;
	int fd = open(filename, 0);
  4a:	51                   	push   %ecx
  4b:	51                   	push   %ecx
  4c:	6a 00                	push   $0x0
  4e:	57                   	push   %edi
  4f:	8d 7d e3             	lea    -0x1d(%ebp),%edi
	short arr[size];
  52:	89 5d d0             	mov    %ebx,-0x30(%ebp)
	int fd = open(filename, 0);
  55:	e8 08 04 00 00       	call   462 <open>
  5a:	89 c6                	mov    %eax,%esi
  5c:	89 d8                	mov    %ebx,%eax
  5e:	83 c4 10             	add    $0x10,%esp
  61:	05 d0 07 00 00       	add    $0x7d0,%eax
  66:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	for(int i=0; i<size; i++){
		read(fd, &c, 1);
  70:	83 ec 04             	sub    $0x4,%esp
  73:	83 c3 02             	add    $0x2,%ebx
  76:	6a 01                	push   $0x1
  78:	57                   	push   %edi
  79:	56                   	push   %esi
  7a:	e8 bb 03 00 00       	call   43a <read>
		arr[i]=c-'0';
  7f:	66 0f be 45 e3       	movsbw -0x1d(%ebp),%ax
		read(fd, &c, 1);
  84:	83 c4 0c             	add    $0xc,%esp
		arr[i]=c-'0';
  87:	83 e8 30             	sub    $0x30,%eax
  8a:	66 89 43 fe          	mov    %ax,-0x2(%ebx)
		read(fd, &c, 1);
  8e:	6a 01                	push   $0x1
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	e8 a3 03 00 00       	call   43a <read>
	for(int i=0; i<size; i++){
  97:	83 c4 10             	add    $0x10,%esp
  9a:	39 5d d4             	cmp    %ebx,-0x2c(%ebp)
  9d:	75 d1                	jne    70 <main+0x70>
	}	
  	close(fd);
  9f:	83 ec 0c             	sub    $0xc,%esp
  a2:	56                   	push   %esi
  a3:	e8 a2 03 00 00       	call   44a <close>
  	// this is to supress warning
  	printf(1,"first elem %d\n", arr[0]);
  a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	0f bf 00             	movswl (%eax),%eax
  b1:	50                   	push   %eax
  b2:	68 16 09 00 00       	push   $0x916
  b7:	6a 01                	push   $0x1
  b9:	e8 e2 04 00 00       	call   5a0 <printf>
  
  	//----FILL THE CODE HERE for unicast sum and multicast variance

	int num_procs = 2;
	int cur_pid = getpid();
  be:	e8 df 03 00 00       	call   4a2 <getpid>
  c3:	89 c3                	mov    %eax,%ebx
	int num_part = size/num_procs;


	// calculate sums and send to the reciever
	for (int i = 0; i < num_procs; i++) {
		int pid = fork();
  c5:	e8 50 03 00 00       	call   41a <fork>
		if (pid == 0)
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	85 c0                	test   %eax,%eax
  cf:	0f 84 aa 00 00 00    	je     17f <main+0x17f>
		int pid = fork();
  d5:	e8 40 03 00 00       	call   41a <fork>
		if (pid == 0)
  da:	85 c0                	test   %eax,%eax
  dc:	0f 84 98 00 00 00    	je     17a <main+0x17a>
	}

	// fetch sums and return 
	for (int i = 0; i < num_procs; ++i) {
		int value=0;
		recv((void*)&value);
  e2:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  e5:	83 ec 0c             	sub    $0xc,%esp
		int value=0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		recv((void*)&value);
  ef:	56                   	push   %esi
  f0:	e8 f5 03 00 00       	call   4ea <recv>
		printf(1,"%d\n", value);
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	ff 75 e4             	pushl  -0x1c(%ebp)
  fb:	68 21 09 00 00       	push   $0x921
 100:	6a 01                	push   $0x1
 102:	e8 99 04 00 00       	call   5a0 <printf>
		tot_sum += (int)value;
 107:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
		recv((void*)&value);
 10a:	89 34 24             	mov    %esi,(%esp)
		int value=0;
 10d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		recv((void*)&value);
 114:	e8 d1 03 00 00       	call   4ea <recv>
		printf(1,"%d\n", value);
 119:	83 c4 0c             	add    $0xc,%esp
 11c:	ff 75 e4             	pushl  -0x1c(%ebp)
 11f:	68 21 09 00 00       	push   $0x921
 124:	6a 01                	push   $0x1
 126:	e8 75 04 00 00       	call   5a0 <printf>



  	//------------------

  	if(type==0){ //unicast sum
 12b:	83 c4 10             	add    $0x10,%esp
 12e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
		tot_sum += (int)value;
 132:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  	if(type==0){ //unicast sum
 135:	74 19                	je     150 <main+0x150>
		printf(1,"Sum of array for file %s is %d\n", filename,tot_sum);
	}
	else{ //mulicast variance
		printf(1,"Variance of array for file %s is %d\n", filename,(int)variance);
 137:	6a 00                	push   $0x0
 139:	ff 75 c8             	pushl  -0x38(%ebp)
 13c:	68 68 09 00 00       	push   $0x968
 141:	6a 01                	push   $0x1
 143:	e8 58 04 00 00       	call   5a0 <printf>
 148:	83 c4 10             	add    $0x10,%esp
	}
	exit();
 14b:	e8 d2 02 00 00       	call   422 <exit>
		tot_sum += (int)value;
 150:	01 c3                	add    %eax,%ebx
		printf(1,"Sum of array for file %s is %d\n", filename,tot_sum);
 152:	53                   	push   %ebx
 153:	ff 75 c8             	pushl  -0x38(%ebp)
 156:	68 48 09 00 00       	push   $0x948
 15b:	6a 01                	push   $0x1
 15d:	e8 3e 04 00 00       	call   5a0 <printf>
 162:	83 c4 10             	add    $0x10,%esp
 165:	eb e4                	jmp    14b <main+0x14b>
		printf(1,"Need type and input filename\n");
 167:	53                   	push   %ebx
 168:	53                   	push   %ebx
 169:	68 f8 08 00 00       	push   $0x8f8
 16e:	6a 01                	push   $0x1
 170:	e8 2b 04 00 00       	call   5a0 <printf>
		exit();
 175:	e8 a8 02 00 00       	call   422 <exit>
	for (int i = 0; i < num_procs; i++) {
 17a:	b8 01 00 00 00       	mov    $0x1,%eax
			int start =  i*num_part;
 17f:	69 c0 f4 01 00 00    	imul   $0x1f4,%eax,%eax
			int tot=0;
 185:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
			for (int j = start; j < end; j++) {
 18c:	31 c9                	xor    %ecx,%ecx
 18e:	31 d2                	xor    %edx,%edx
 190:	8b 7d d0             	mov    -0x30(%ebp),%edi
			int end   = (i+1)*num_part;
 193:	8d b0 f4 01 00 00    	lea    0x1f4(%eax),%esi
			for (int j = start; j < end; j++) {
 199:	eb 0e                	jmp    1a9 <main+0x1a9>
				tot += arr[j];	
 19b:	0f bf 0c 47          	movswl (%edi,%eax,2),%ecx
			for (int j = start; j < end; j++) {
 19f:	83 c0 01             	add    $0x1,%eax
				tot += arr[j];	
 1a2:	01 ca                	add    %ecx,%edx
 1a4:	b9 01 00 00 00       	mov    $0x1,%ecx
			for (int j = start; j < end; j++) {
 1a9:	39 f0                	cmp    %esi,%eax
 1ab:	75 ee                	jne    19b <main+0x19b>
 1ad:	84 c9                	test   %cl,%cl
 1af:	75 16                	jne    1c7 <main+0x1c7>
			send(getpid(), cur_pid, (void*) &tot);
 1b1:	e8 ec 02 00 00       	call   4a2 <getpid>
 1b6:	52                   	push   %edx
 1b7:	8d 55 e4             	lea    -0x1c(%ebp),%edx
 1ba:	52                   	push   %edx
 1bb:	53                   	push   %ebx
 1bc:	50                   	push   %eax
 1bd:	e8 20 03 00 00       	call   4e2 <send>
			exit();
 1c2:	e8 5b 02 00 00       	call   422 <exit>
 1c7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 1ca:	eb e5                	jmp    1b1 <main+0x1b1>
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 db                	test   %bl,%bl
 1ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 1ef:	75 ef                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1f1:	5b                   	pop    %ebx
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	84 c0                	test   %al,%al
 212:	75 1c                	jne    230 <strcmp+0x30>
 214:	eb 2a                	jmp    240 <strcmp+0x40>
 216:	8d 76 00             	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 220:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 223:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 226:	83 c1 01             	add    $0x1,%ecx
 229:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 22c:	84 c0                	test   %al,%al
 22e:	74 10                	je     240 <strcmp+0x40>
 230:	38 d8                	cmp    %bl,%al
 232:	74 ec                	je     220 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 234:	29 d8                	sub    %ebx,%eax
}
 236:	5b                   	pop    %ebx
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 242:	29 d8                	sub    %ebx,%eax
}
 244:	5b                   	pop    %ebx
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 270:	31 c0                	xor    %eax,%eax
}
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    
 274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 27a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d9                	mov    %ebx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	31 f6                	xor    %esi,%esi
 2e8:	89 f3                	mov    %esi,%ebx
{
 2ea:	83 ec 1c             	sub    $0x1c,%esp
 2ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2f0:	eb 2f                	jmp    321 <gets+0x41>
 2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2fb:	83 ec 04             	sub    $0x4,%esp
 2fe:	6a 01                	push   $0x1
 300:	50                   	push   %eax
 301:	6a 00                	push   $0x0
 303:	e8 32 01 00 00       	call   43a <read>
    if(cc < 1)
 308:	83 c4 10             	add    $0x10,%esp
 30b:	85 c0                	test   %eax,%eax
 30d:	7e 1c                	jle    32b <gets+0x4b>
      break;
    buf[i++] = c;
 30f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 313:	83 c7 01             	add    $0x1,%edi
 316:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 319:	3c 0a                	cmp    $0xa,%al
 31b:	74 23                	je     340 <gets+0x60>
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 1f                	je     340 <gets+0x60>
  for(i=0; i+1 < max; ){
 321:	83 c3 01             	add    $0x1,%ebx
 324:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 327:	89 fe                	mov    %edi,%esi
 329:	7c cd                	jl     2f8 <gets+0x18>
 32b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 330:	c6 03 00             	movb   $0x0,(%ebx)
}
 333:	8d 65 f4             	lea    -0xc(%ebp),%esp
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	90                   	nop
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	8b 75 08             	mov    0x8(%ebp),%esi
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	01 de                	add    %ebx,%esi
 348:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 34a:	c6 03 00             	movb   $0x0,(%ebx)
}
 34d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5f                   	pop    %edi
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    
 355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	pushl  0x8(%ebp)
 36d:	e8 f0 00 00 00       	call   462 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	pushl  0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f3 00 00 00       	call   47a <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 b9 00 00 00       	call   44a <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3c4:	77 1f                	ja     3e5 <atoi+0x35>
 3c6:	8d 76 00             	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3d3:	83 c1 01             	add    $0x1,%ecx
 3d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3da:	0f be 11             	movsbl (%ecx),%edx
 3dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	5b                   	pop    %ebx
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 db                	test   %ebx,%ebx
 400:	7e 14                	jle    416 <memmove+0x26>
 402:	31 d2                	xor    %edx,%edx
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 408:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 40c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 40f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 412:	39 d3                	cmp    %edx,%ebx
 414:	75 f2                	jne    408 <memmove+0x18>
  return vdst;
}
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41a:	b8 01 00 00 00       	mov    $0x1,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exit>:
SYSCALL(exit)
 422:	b8 02 00 00 00       	mov    $0x2,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <wait>:
SYSCALL(wait)
 42a:	b8 03 00 00 00       	mov    $0x3,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <pipe>:
SYSCALL(pipe)
 432:	b8 04 00 00 00       	mov    $0x4,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <read>:
SYSCALL(read)
 43a:	b8 05 00 00 00       	mov    $0x5,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <write>:
SYSCALL(write)
 442:	b8 10 00 00 00       	mov    $0x10,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <close>:
SYSCALL(close)
 44a:	b8 15 00 00 00       	mov    $0x15,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <kill>:
SYSCALL(kill)
 452:	b8 06 00 00 00       	mov    $0x6,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <exec>:
SYSCALL(exec)
 45a:	b8 07 00 00 00       	mov    $0x7,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <open>:
SYSCALL(open)
 462:	b8 0f 00 00 00       	mov    $0xf,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <mknod>:
SYSCALL(mknod)
 46a:	b8 11 00 00 00       	mov    $0x11,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <unlink>:
SYSCALL(unlink)
 472:	b8 12 00 00 00       	mov    $0x12,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <fstat>:
SYSCALL(fstat)
 47a:	b8 08 00 00 00       	mov    $0x8,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <link>:
SYSCALL(link)
 482:	b8 13 00 00 00       	mov    $0x13,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mkdir>:
SYSCALL(mkdir)
 48a:	b8 14 00 00 00       	mov    $0x14,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <chdir>:
SYSCALL(chdir)
 492:	b8 09 00 00 00       	mov    $0x9,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <dup>:
SYSCALL(dup)
 49a:	b8 0a 00 00 00       	mov    $0xa,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <getpid>:
SYSCALL(getpid)
 4a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <sbrk>:
SYSCALL(sbrk)
 4aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <sleep>:
SYSCALL(sleep)
 4b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <uptime>:
SYSCALL(uptime)
 4ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <toggle>:
SYSCALL(toggle)
 4c2:	b8 16 00 00 00       	mov    $0x16,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <print_count>:
SYSCALL(print_count)
 4ca:	b8 17 00 00 00       	mov    $0x17,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <add>:
SYSCALL(add)
 4d2:	b8 18 00 00 00       	mov    $0x18,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <ps>:
SYSCALL(ps)
 4da:	b8 19 00 00 00       	mov    $0x19,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <send>:
SYSCALL(send)
 4e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <recv>:
SYSCALL(recv)
 4ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    
 4f2:	66 90                	xchg   %ax,%ax
 4f4:	66 90                	xchg   %ax,%ax
 4f6:	66 90                	xchg   %ax,%ax
 4f8:	66 90                	xchg   %ax,%ax
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 509:	85 d2                	test   %edx,%edx
{
 50b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 50e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 510:	79 76                	jns    588 <printint+0x88>
 512:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 516:	74 70                	je     588 <printint+0x88>
    x = -xx;
 518:	f7 d8                	neg    %eax
    neg = 1;
 51a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 521:	31 f6                	xor    %esi,%esi
 523:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 526:	eb 0a                	jmp    532 <printint+0x32>
 528:	90                   	nop
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 fe                	mov    %edi,%esi
 532:	31 d2                	xor    %edx,%edx
 534:	8d 7e 01             	lea    0x1(%esi),%edi
 537:	f7 f1                	div    %ecx
 539:	0f b6 92 98 09 00 00 	movzbl 0x998(%edx),%edx
  }while((x /= base) != 0);
 540:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 542:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 545:	75 e9                	jne    530 <printint+0x30>
  if(neg)
 547:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 54a:	85 c0                	test   %eax,%eax
 54c:	74 08                	je     556 <printint+0x56>
    buf[i++] = '-';
 54e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 553:	8d 7e 02             	lea    0x2(%esi),%edi
 556:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 55a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
 566:	83 ee 01             	sub    $0x1,%esi
 569:	6a 01                	push   $0x1
 56b:	53                   	push   %ebx
 56c:	57                   	push   %edi
 56d:	88 45 d7             	mov    %al,-0x29(%ebp)
 570:	e8 cd fe ff ff       	call   442 <write>

  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x60>
    putc(fd, buf[i]);
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 58f:	eb 90                	jmp    521 <printint+0x21>
 591:	eb 0d                	jmp    5a0 <printf>
 593:	90                   	nop
 594:	90                   	nop
 595:	90                   	nop
 596:	90                   	nop
 597:	90                   	nop
 598:	90                   	nop
 599:	90                   	nop
 59a:	90                   	nop
 59b:	90                   	nop
 59c:	90                   	nop
 59d:	90                   	nop
 59e:	90                   	nop
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5ac:	0f b6 1e             	movzbl (%esi),%ebx
 5af:	84 db                	test   %bl,%bl
 5b1:	0f 84 b3 00 00 00    	je     66a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 5b7:	8d 45 10             	lea    0x10(%ebp),%eax
 5ba:	83 c6 01             	add    $0x1,%esi
  state = 0;
 5bd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 5bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5c2:	eb 2f                	jmp    5f3 <printf+0x53>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	0f 84 a7 00 00 00    	je     678 <printf+0xd8>
  write(fd, &c, 1);
 5d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5d4:	83 ec 04             	sub    $0x4,%esp
 5d7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5da:	6a 01                	push   $0x1
 5dc:	50                   	push   %eax
 5dd:	ff 75 08             	pushl  0x8(%ebp)
 5e0:	e8 5d fe ff ff       	call   442 <write>
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5eb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5ef:	84 db                	test   %bl,%bl
 5f1:	74 77                	je     66a <printf+0xca>
    if(state == 0){
 5f3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5f5:	0f be cb             	movsbl %bl,%ecx
 5f8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5fb:	74 cb                	je     5c8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5fd:	83 ff 25             	cmp    $0x25,%edi
 600:	75 e6                	jne    5e8 <printf+0x48>
      if(c == 'd'){
 602:	83 f8 64             	cmp    $0x64,%eax
 605:	0f 84 05 01 00 00    	je     710 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 60b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 611:	83 f9 70             	cmp    $0x70,%ecx
 614:	74 72                	je     688 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 616:	83 f8 73             	cmp    $0x73,%eax
 619:	0f 84 99 00 00 00    	je     6b8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61f:	83 f8 63             	cmp    $0x63,%eax
 622:	0f 84 08 01 00 00    	je     730 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 ef 00 00 00    	je     720 <printf+0x180>
  write(fd, &c, 1);
 631:	8d 45 e7             	lea    -0x19(%ebp),%eax
 634:	83 ec 04             	sub    $0x4,%esp
 637:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63b:	6a 01                	push   $0x1
 63d:	50                   	push   %eax
 63e:	ff 75 08             	pushl  0x8(%ebp)
 641:	e8 fc fd ff ff       	call   442 <write>
 646:	83 c4 0c             	add    $0xc,%esp
 649:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 64c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 64f:	6a 01                	push   $0x1
 651:	50                   	push   %eax
 652:	ff 75 08             	pushl  0x8(%ebp)
 655:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 658:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 65a:	e8 e3 fd ff ff       	call   442 <write>
  for(i = 0; fmt[i]; i++){
 65f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 663:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 666:	84 db                	test   %bl,%bl
 668:	75 89                	jne    5f3 <printf+0x53>
    }
  }
}
 66a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66d:	5b                   	pop    %ebx
 66e:	5e                   	pop    %esi
 66f:	5f                   	pop    %edi
 670:	5d                   	pop    %ebp
 671:	c3                   	ret    
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 678:	bf 25 00 00 00       	mov    $0x25,%edi
 67d:	e9 66 ff ff ff       	jmp    5e8 <printf+0x48>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	b9 10 00 00 00       	mov    $0x10,%ecx
 690:	6a 00                	push   $0x0
 692:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	8b 17                	mov    (%edi),%edx
 69a:	e8 61 fe ff ff       	call   500 <printint>
        ap++;
 69f:	89 f8                	mov    %edi,%eax
 6a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a4:	31 ff                	xor    %edi,%edi
        ap++;
 6a6:	83 c0 04             	add    $0x4,%eax
 6a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6ac:	e9 37 ff ff ff       	jmp    5e8 <printf+0x48>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6bb:	8b 08                	mov    (%eax),%ecx
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6c3:	85 c9                	test   %ecx,%ecx
 6c5:	0f 84 8e 00 00 00    	je     759 <printf+0x1b9>
        while(*s != 0){
 6cb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6ce:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6d0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6d2:	84 c0                	test   %al,%al
 6d4:	0f 84 0e ff ff ff    	je     5e8 <printf+0x48>
 6da:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6dd:	89 de                	mov    %ebx,%esi
 6df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6e2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6e5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6e8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6eb:	83 c6 01             	add    $0x1,%esi
 6ee:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6f1:	6a 01                	push   $0x1
 6f3:	57                   	push   %edi
 6f4:	53                   	push   %ebx
 6f5:	e8 48 fd ff ff       	call   442 <write>
        while(*s != 0){
 6fa:	0f b6 06             	movzbl (%esi),%eax
 6fd:	83 c4 10             	add    $0x10,%esp
 700:	84 c0                	test   %al,%al
 702:	75 e4                	jne    6e8 <printf+0x148>
 704:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 707:	31 ff                	xor    %edi,%edi
 709:	e9 da fe ff ff       	jmp    5e8 <printf+0x48>
 70e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
 718:	6a 01                	push   $0x1
 71a:	e9 73 ff ff ff       	jmp    692 <printf+0xf2>
 71f:	90                   	nop
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 726:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 729:	6a 01                	push   $0x1
 72b:	e9 21 ff ff ff       	jmp    651 <printf+0xb1>
        putc(fd, *ap);
 730:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 736:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
        ap++;
 73a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 73d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 740:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 743:	50                   	push   %eax
 744:	ff 75 08             	pushl  0x8(%ebp)
 747:	e8 f6 fc ff ff       	call   442 <write>
        ap++;
 74c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 74f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 752:	31 ff                	xor    %edi,%edi
 754:	e9 8f fe ff ff       	jmp    5e8 <printf+0x48>
          s = "(null)";
 759:	bb 90 09 00 00       	mov    $0x990,%ebx
        while(*s != 0){
 75e:	b8 28 00 00 00       	mov    $0x28,%eax
 763:	e9 72 ff ff ff       	jmp    6da <printf+0x13a>
 768:	66 90                	xchg   %ax,%ax
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 48 0c 00 00       	mov    0xc48,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 77e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 788:	39 c8                	cmp    %ecx,%eax
 78a:	8b 10                	mov    (%eax),%edx
 78c:	73 32                	jae    7c0 <free+0x50>
 78e:	39 d1                	cmp    %edx,%ecx
 790:	72 04                	jb     796 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 792:	39 d0                	cmp    %edx,%eax
 794:	72 32                	jb     7c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 796:	8b 73 fc             	mov    -0x4(%ebx),%esi
 799:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79c:	39 fa                	cmp    %edi,%edx
 79e:	74 30                	je     7d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a3:	8b 50 04             	mov    0x4(%eax),%edx
 7a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a9:	39 f1                	cmp    %esi,%ecx
 7ab:	74 3a                	je     7e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ad:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7af:	a3 48 0c 00 00       	mov    %eax,0xc48
}
 7b4:	5b                   	pop    %ebx
 7b5:	5e                   	pop    %esi
 7b6:	5f                   	pop    %edi
 7b7:	5d                   	pop    %ebp
 7b8:	c3                   	ret    
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	39 d0                	cmp    %edx,%eax
 7c2:	72 04                	jb     7c8 <free+0x58>
 7c4:	39 d1                	cmp    %edx,%ecx
 7c6:	72 ce                	jb     796 <free+0x26>
{
 7c8:	89 d0                	mov    %edx,%eax
 7ca:	eb bc                	jmp    788 <free+0x18>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 72 04             	add    0x4(%edx),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 12                	mov    (%edx),%edx
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	75 c6                	jne    7ad <free+0x3d>
    p->s.size += bp->s.size;
 7e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ea:	a3 48 0c 00 00       	mov    %eax,0xc48
    p->s.size += bp->s.size;
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f5:	89 10                	mov    %edx,(%eax)
}
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 15 48 0c 00 00    	mov    0xc48,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 78 07             	lea    0x7(%eax),%edi
 815:	c1 ef 03             	shr    $0x3,%edi
 818:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 81b:	85 d2                	test   %edx,%edx
 81d:	0f 84 9d 00 00 00    	je     8c0 <malloc+0xc0>
 823:	8b 02                	mov    (%edx),%eax
 825:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 828:	39 cf                	cmp    %ecx,%edi
 82a:	76 6c                	jbe    898 <malloc+0x98>
 82c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 832:	bb 00 10 00 00       	mov    $0x1000,%ebx
 837:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 83a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 841:	eb 0e                	jmp    851 <malloc+0x51>
 843:	90                   	nop
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 f9                	cmp    %edi,%ecx
 84f:	73 47                	jae    898 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	39 05 48 0c 00 00    	cmp    %eax,0xc48
 857:	89 c2                	mov    %eax,%edx
 859:	75 ed                	jne    848 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	56                   	push   %esi
 85f:	e8 46 fc ff ff       	call   4aa <sbrk>
  if(p == (char*)-1)
 864:	83 c4 10             	add    $0x10,%esp
 867:	83 f8 ff             	cmp    $0xffffffff,%eax
 86a:	74 1c                	je     888 <malloc+0x88>
  hp->s.size = nu;
 86c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86f:	83 ec 0c             	sub    $0xc,%esp
 872:	83 c0 08             	add    $0x8,%eax
 875:	50                   	push   %eax
 876:	e8 f5 fe ff ff       	call   770 <free>
  return freep;
 87b:	8b 15 48 0c 00 00    	mov    0xc48,%edx
      if((p = morecore(nunits)) == 0)
 881:	83 c4 10             	add    $0x10,%esp
 884:	85 d2                	test   %edx,%edx
 886:	75 c0                	jne    848 <malloc+0x48>
        return 0;
  }
}
 888:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 88b:	31 c0                	xor    %eax,%eax
}
 88d:	5b                   	pop    %ebx
 88e:	5e                   	pop    %esi
 88f:	5f                   	pop    %edi
 890:	5d                   	pop    %ebp
 891:	c3                   	ret    
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 898:	39 cf                	cmp    %ecx,%edi
 89a:	74 54                	je     8f0 <malloc+0xf0>
        p->s.size -= nunits;
 89c:	29 f9                	sub    %edi,%ecx
 89e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8a4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8a7:	89 15 48 0c 00 00    	mov    %edx,0xc48
}
 8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8b0:	83 c0 08             	add    $0x8,%eax
}
 8b3:	5b                   	pop    %ebx
 8b4:	5e                   	pop    %esi
 8b5:	5f                   	pop    %edi
 8b6:	5d                   	pop    %ebp
 8b7:	c3                   	ret    
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8c0:	c7 05 48 0c 00 00 4c 	movl   $0xc4c,0xc48
 8c7:	0c 00 00 
 8ca:	c7 05 4c 0c 00 00 4c 	movl   $0xc4c,0xc4c
 8d1:	0c 00 00 
    base.s.size = 0;
 8d4:	b8 4c 0c 00 00       	mov    $0xc4c,%eax
 8d9:	c7 05 50 0c 00 00 00 	movl   $0x0,0xc50
 8e0:	00 00 00 
 8e3:	e9 44 ff ff ff       	jmp    82c <malloc+0x2c>
 8e8:	90                   	nop
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8f0:	8b 08                	mov    (%eax),%ecx
 8f2:	89 0a                	mov    %ecx,(%edx)
 8f4:	eb b1                	jmp    8a7 <malloc+0xa7>
