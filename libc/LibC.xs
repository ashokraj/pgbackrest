#define PERL_NO_GET_CONTEXT

#include <factorial.h>

/*
 * The following C types are mapped by the current typemap:
 * 'AV *', 'Boolean', 'CV *', 'FILE *', 'FileHandle', 'HV *', 'I16', 'I32', 'I8', 'IV', 'InOutStream', 'InputStream', 'NV',
 * 'OutputStream', 'PerlIO *', 'Result', 'STRLEN', 'SV *', 'SVREF', 'SysRet', 'SysRetLong', 'Time_t *', 'U16', 'U32', 'U8', 'UV',
 * 'bool', 'bool_t', 'caddr_t', 'char', 'char *', 'char **', 'const char *', 'double', 'float', 'int', 'long', 'short', 'size_t',
 * 'ssize_t', 'time_t', 'unsigned', 'unsigned char', 'unsigned char *', 'unsigned int', 'unsigned long', 'unsigned long *',
 * 'unsigned short', 'void *', 'wchar_t', 'wchar_t *'
 */

MODULE = pgBackRest::LibC    PACKAGE = pgBackRest::LibC

double
factorial_iterative_c(x)
    int x

double
factorial_recursive_c(x)
    int x

U16
returnMagic(x)
    U16 x

UV
returnMagic2(x)
    UV x
