// Regression: compiler errors must be fatal -- nonzero exit, program (and
// its broken bytecode) never executed. A non-lvalue expression passed to a
// VAR-parameter builtin is a guaranteed compile error.
int main() {
    getdate(1 + 2, 3, 4, 5);
    return 0;
}
