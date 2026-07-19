// Regression: `result` is an ordinary identifier in clike, but the shared
// compiler used to register Pascal's `Result` return-value alias as a local
// in every value-returning function, silently shadowing a user global of
// that name (reads inside main saw the return slot, not the global).
int result = 0;

void setit() { result = 7; }

int bump(int n) {
    result = result + n;
    return result;
}

int main() {
    setit();
    printf("after setit: %d\n", result);
    int r = bump(3);
    printf("after bump: %d %d\n", r, result);
    result = result * 2;
    printf("direct: %d\n", result);
    return 0;
}
