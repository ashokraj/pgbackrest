#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

typedef U8 uint8;       /* ==  8 bits */
typedef U16 uint16;     /* == 16 bits */
typedef U32 uint32;     /* == 32 bits */
typedef UV uint64;      /* == 64 bits */

typedef I8 int8;       /* ==  8 bits */
typedef I16 int16;     /* == 16 bits */
typedef I32 int32;     /* == 32 bits */
typedef IV int64;      /* == 64 bits */

#define DUDEMAN 69
#define DUDESTRING "It's a String"

/***********************************************************************************************************************************
Each data file (heap or index) is divided into postgres disk blocks (which may be thought of as the unit of i/o -- a postgres
buffer contains exactly one disk block). The blocks are numbered sequentially, 0 to 0xFFFFFFFE.
***********************************************************************************************************************************/
typedef uint32 BlockNumber;

// typedef enum ScanDirection
// {
// 	BackwardScanDirection = -1,
// 	NoMovementScanDirection = 0,
// 	ForwardScanDirection = 1
// } ScanDirection;

uint16 returnMagic(uint16 x);
uint64 returnMagic2(uint64 x);

uint16 pg_checksum_page(char *page, uint32 blkno, uint32 pageSize);
