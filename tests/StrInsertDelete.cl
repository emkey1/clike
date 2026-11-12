// strinsert(s, pos, t) and strdelete(s, pos, n) return a new string; positions
// are 1-based like copy and pos, and are clipped to the string.
int main() {
    str s = "Hello World";
    printf("[%s]\n", strinsert(s, 6, ","));
    printf("[%s]\n", strinsert(s, 1, ">"));
    printf("[%s]\n", strinsert(s, 100, "!"));
    printf("[%s]\n", strinsert(s, 0, "<"));
    printf("[%s]\n", strdelete(s, 6, 1));
    printf("[%s]\n", strdelete(s, 6, 100));
    printf("[%s]\n", strdelete(s, 0, 2));
    printf("[%s]\n", strdelete(s, 50, 2));
    printf("[%s]\n", s);
    str t = strdelete(strinsert(s, 7, "big "), 1, 6);
    printf("[%s] %d\n", t, strlen(t));
    return 0;
}
