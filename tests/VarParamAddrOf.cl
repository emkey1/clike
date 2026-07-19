// Regression: address-of arguments to VAR-parameter builtins (getdate,
// gettime, getmousestate, ...) must compile and bind to the pointee, the
// same as passing the bare variable. Broke after the move to the shared
// bytecode compiler ("Invalid expression cannot be used as a variable
// reference (L-Value)" + segfault).
int main() {
    int yr = 0, mo = 0, dy = 0, dow = 0;
    getdate(&yr, &mo, &dy, &dow);
    printf("date populated=%d\n",
           yr >= 2020 && mo >= 1 && mo <= 12 && dy >= 1 && dy <= 31 && dow >= 0 && dow <= 6);

    // Mixed bare/address-of arguments and an array-element target.
    int parts[4];
    parts[0] = -1; parts[1] = -1; parts[2] = -1; parts[3] = -1;
    int ms = -1;
    gettime(parts[0], &parts[1], parts[2], &ms);
    printf("time populated=%d\n",
           parts[0] >= 0 && parts[1] >= 0 && parts[2] >= 0 && ms >= 0);
    return 0;
}
