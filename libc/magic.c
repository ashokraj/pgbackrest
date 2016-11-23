#include "LibC.h"

uint16 returnMagic(uint16 x)
{
    return x << 15;
    // return x + 123;
}

uint64 returnMagic2(uint64 x)
{
    return x << 63;
    // return x + 123;
}
