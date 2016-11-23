#define PERL_NO_GET_CONTEXT

#include "LibC.h"
#include "const-c.inc"

/*
 * The following C types are mapped by the current typemap:
 * 'AV *', 'Boolean', 'CV *', 'FILE *', 'FileHandle', 'HV *', 'I16', 'I32', 'I8', 'IV', 'InOutStream', 'InputStream', 'NV',
 * 'OutputStream', 'PerlIO *', 'Result', 'STRLEN', 'SV *', 'SVREF', 'SysRet', 'SysRetLong', 'Time_t *', 'U16', 'U32', 'U8', 'UV',
 * 'bool', 'bool_t', 'caddr_t', 'char', 'char *', 'char **', 'const char *', 'double', 'float', 'int', 'long', 'short', 'size_t',
 * 'ssize_t', 'time_t', 'unsigned', 'unsigned char', 'unsigned char *', 'unsigned int', 'unsigned long', 'unsigned long *',
 * 'unsigned short', 'void *', 'wchar_t', 'wchar_t *'
 */

MODULE = pgBackRest::LibC    PACKAGE = pgBackRest::LibC

INCLUDE: const-xs.inc

U16
returnMagic(x)
    U16 x

UV
returnMagic2(x)
    UV x

U16
pageChecksum(page, blkno, pageSize)
    char * page
    U32 blkno
    U32 pageSize

bool
pageChecksumBuffer(szPageBuffer, bufferSize, blockNoStart, pageSize)
    char *szPageBuffer
    U32 bufferSize
    U32 blockNoStart
    U32 pageSize
