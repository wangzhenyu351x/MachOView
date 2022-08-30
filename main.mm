//
//  main.m
//  Mach-O Browser
//
//  Created by psaghelyi on 10/06/2010.
//


// every std IO operation needs to be paused until pipes are in use
NSCondition * pipeCondition;
int32_t numIOThread;
BOOL needDumpMethName = FALSE;

static __attribute__((constructor)) void testload(int argc,const char **argv,const char** envp) {
    const char** p = envp;
    for(; *p != NULL; p++) {
        if (strcmp(*p, "dump=1") == 0) {
            NSLog(@"need dump");
            needDumpMethName = YES;
            break;
        }
    }
}


int 
main(int argc, const char *argv[])
{
  pipeCondition = [[NSCondition alloc]init];
  numIOThread = 0;
  return NSApplicationMain(argc, argv);
}
