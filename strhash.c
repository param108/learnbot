#include <stdbool.h>
#include <string.h>
#include "hashmap.h"

int strhash(void *key) {
  char *chkey = (char*)key;
  int len = strlen(chkey);
  return hashmapHash(key,len);
}

bool strequals(void *keyA, void *keyB) {
  char *chA = (char*)keyA;
  char *chB = (char*)keyB;
  return (!strcmp(chA,chB));
}

Hashmap* strhashCreate() {
    return hashmapCreate(20,strhash,strequals);
}
