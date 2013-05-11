#ifndef HASHMAP_H
#define HASHMAP_H
#include <stdbool.h>
#include <stdlib.h>
typedef struct _Entry {
    void* key;
    int hash;
    void* value;
    struct _Entry* next;
} Entry;

typedef struct _Hashmap {
    Entry** buckets;
    size_t bucketCount;
    int (*hash)(void* key);
    bool (*equals)(void* keyA, void* keyB);
  //mutex_t lock; 
    size_t size;
} Hashmap;

extern Hashmap* hashmapCreate(size_t initialCapacity,
			      int (*hash)(void* key), 
			      bool (*equals)(void* keyA, void* keyB));
extern void hashmapFree(Hashmap* map);
extern void* hashmapGet(Hashmap* map, void* key);
extern void* hashmapPut(Hashmap* map, void* key, void* value);
extern void* hashmapRemove(Hashmap* map, void* key);
extern void hashmapForEach(Hashmap* map, 
			   bool (*callback)(void* key, 
					    void* value, void* context),
			   void* context);
extern int hashmapHash(void* key, size_t keySize);
#endif
