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

// typedef enum ScanDirection
// {
// 	BackwardScanDirection = -1,
// 	NoMovementScanDirection = 0,
// 	ForwardScanDirection = 1
// } ScanDirection;

uint16 returnMagic(uint16 x);
uint64 returnMagic2(uint64 x);
