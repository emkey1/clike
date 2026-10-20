// `~x` is bitwise: x ^ -1. It compiled to the logical NOT, so ~5 was 0 and
// ~0 was 1.
int main() {
    int i = 5;
    long big = 4294967296;
    char c = 'a';
    printf("%d\n", ~i);
    printf("%d\n", ~0);
    printf("%d\n", ~(-1));
    printf("%ld\n", ~big);
    printf("%d\n", ~c);
    printf("%d\n", (~i) & 255);
    printf("%d\n", !i);
    printf("%d\n", !0);
    return 0;
}
