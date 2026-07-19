// Regression: spawning a function that is defined later in the file must
// compile (the shared compiler resolves the target by name at spawn time).
// Previously: "Compiler error: Undefined procedure 'worker' in spawn".
int main() {
    int t = spawn worker();
    join t;
    printf("main done\n");
    return 0;
}

void worker() {
    printf("worker ran\n");
}
