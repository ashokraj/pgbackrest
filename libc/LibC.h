#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/***********************************************************************************************************************************
Define integer types based on Perl portability
***********************************************************************************************************************************/
typedef U8 uint8;       /* ==  8 bits */
typedef U16 uint16;     /* == 16 bits */
typedef U32 uint32;     /* == 32 bits */
typedef UV uint64;      /* == 64 bits */

typedef I8 int8;       /* ==  8 bits */
typedef I16 int16;     /* == 16 bits */
typedef I32 int32;     /* == 32 bits */
typedef IV int64;      /* == 64 bits */

/***********************************************************************************************************************************
Checksum functions
***********************************************************************************************************************************/
uint16 pageChecksum(char *page, uint32 blkno, uint32 pageSize);
bool pageChecksumBuffer(char *szPageBuffer, uint32 uiBufferSize, uint32 uiBlockNoStart, uint32 uiPageSize);

// !!! TEST STUFF
#define DUDEMAN 69
#define DUDESTRING "It's a String"
