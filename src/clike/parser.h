#ifndef CLIKE_PARSER_H
#define CLIKE_PARSER_H

#include "clike/lexer.h"
#include "clike/ast.h"
#include "core/globals.h"

// Forward declaration of core AST for struct type metadata
typedef struct AST AST;

typedef struct {
    ClikeLexer lexer;
    ClikeToken current;
    ClikeToken next;
    char **imports;
    int import_count;
    int import_capacity;
} ParserClike;

void initParserClike(ParserClike *parser, const char *source);
void freeParserClike(ParserClike *parser);
ASTNodeClike* parseProgramClike(ParserClike *parser);
ASTNodeClike* clikeSpawnStatement(ParserClike *p);
ASTNodeClike* clikeJoinStatement(ParserClike *p);
void clikeResetParserState(void);

extern PSCAL_THREAD_LOCAL char **clike_imports;
extern PSCAL_THREAD_LOCAL int clike_import_count;

// Struct type registration and lookup
AST* clikeLookupStruct(const char *name);
void clikeRegisterStruct(const char *name, AST *ast);
void clikeFreeStructs(void);

VarType clikeTokenTypeToVarType(ClikeTokenType t);
const char* clikeTokenTypeToTypeName(ClikeTokenType t);

#endif
