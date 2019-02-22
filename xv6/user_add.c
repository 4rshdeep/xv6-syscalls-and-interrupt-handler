#include "types.h"
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[]) {
	// If you follow the naming convetion, system call
	// name will be sys_toggle and you
	// call it by calling
	add(atoi(argv[1]), atoi(argv[2]));
	exit();

}