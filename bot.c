#include "hashmap.h"
#include "strhash.h"
#include "bot.h"

bot *createBot() {
  bot *ret = (bot*)malloc(sizeof(bot));
  ret->properties = strhashCreate();
}

void freeBot(bot *ret) {
  hashmapFree(ret->properties);
}
