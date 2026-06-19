# clike

**CLike** is a C-like programming language front end for the **PSCAL** VM. CLike
parses C-style syntax into the shared PSCAL AST, which the shared bytecode
compiler lowers and the PSCAL VM runs.

CLike carries no VM or code generator of its own. It builds against
[`pscal-core`](https://github.com/emkey1/pscal-core), pulled in automatically via
CMake `FetchContent`, so building this repo on its own fetches and builds the
shared core too.

The dependency chain is **clike -> pscal-core**, wired automatically through
CMake `FetchContent`.

## Build

```sh
cmake -S . -B build      # fetches pscal-core and builds clike
cmake --build build -j
./build/clike --no-cache program.cl
```

## Install

```sh
cmake --install build --prefix /usr/local
```

This puts the `clike` binary in `<prefix>/bin`, the example programs in
`<prefix>/share/clike/examples`, and the language docs in
`<prefix>/share/doc/clike`. The fetched dependency (pscal-core) declares no
install rules, so only CLike's own artifacts are installed.

## Test

The `.cl` conformance corpus lives in [`tests/`](tests/) and runs under CTest:

```sh
ctest --test-dir build --output-on-failure
```

You can also run it directly against any binary by pointing `CLIKE_BIN` at it
(this is how the umbrella build exercises the same corpus):

```sh
CLIKE_BIN=./build/clike tests/run.sh
```

The minimal build ships graphics, SQLite, and networking builtins OFF, so the
corpus skips the fixtures that need them; a full build with those features
enabled runs the complete set. Network fixtures additionally require
`RUN_NET_TESTS=1`.

## Examples

Runnable programs live in [`examples/`](examples/), from `base/hello` through the
SDL demos under `sdl/`:

```sh
./build/clike --no-cache examples/base/hello
./build/clike --no-cache examples/base/fibonacci_native
```

## Docs

In-depth language documentation is in [`docs/`](docs/):

- [`clike_overview.md`](docs/clike_overview.md): a short tour of the language
- [`clike_language_reference.md`](docs/clike_language_reference.md): the full language reference
- [`clike_tutorial.md`](docs/clike_tutorial.md): a worked tutorial
- [`clike_repl_tutorial.md`](docs/clike_repl_tutorial.md): using the interactive REPL
- [`clike_tiny_compiler.md`](docs/clike_tiny_compiler.md): the tiny self-hosting compiler walkthrough

## History

Extracted from the PSCAL monorepo (emkey1/pscal) with full per-file history
preserved.
