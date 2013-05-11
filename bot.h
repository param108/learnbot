#include <stdio.h>


extern int varmap[100];

static inline int rt_getVarVal(int varnum) {
  return varmap[varnum];
}

static inline int rt_setVarVal(int varnum, int varval) {
  return (varmap[varnum] = varval);
}

typedef struct _bot {
  Hashmap* properties;
} bot;

bot *createBot();
