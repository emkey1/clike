# clike

A C-like programming language front end for the **PSCAL** VM. CLike parses
C-style syntax into the shared PSCAL AST, which the shared bytecode compiler
lowers and the PSCAL VM runs.

CLike carries no VM or code generator of its own — it builds against
[`pscal-core`](https://github.com/emkey1/pscal-core), pulled in automatically via
CMake `FetchContent`.

## Build

```sh
cmake -S . -B build      # fetches and builds pscal-core, then clike
cmake --build build -j
./build/clike --no-cache program.cl
```

## History

Extracted from the PSCAL monorepo (emkey1/pscal) with full per-file history
preserved.
