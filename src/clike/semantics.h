#ifndef CLIKE_SEMANTICS_H
#define CLIKE_SEMANTICS_H

#include "clike/ast.h"

void analyzeSemanticsClike(ASTNodeClike *program, const char *current_path);
void clikeResetSemanticsState(void);
/* Where an import is: the path as given, CLIKE_LIB_DIR, lib/clike above the
 * binary, then the install root. A malloc'd path, or NULL if none opens. */
char *clikeResolveImportPath(const char *orig_path);

#endif
