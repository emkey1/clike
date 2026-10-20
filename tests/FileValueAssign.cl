// Assigning the file fopen returns stores a copy; freeing the temporary
// must not close the file the variable now holds.
text GFile;
str P1;
str P2;
str M;

void put(text t, int n) {
    fprintf(t, "put %d\n", n);
}

int main() {
    text f;
    str line;
    P1 = "fva_out1.txt";
    P2 = "fva_out2.txt";
    M = "w";
    M = M + "";
    f = fopen(P1, M);
    fprintf(f, "hello %d\n", 5);
    put(f, 6);
    fclose(f);
    GFile = fopen(P2, M);
    fprintf(GFile, "global %d\n", 7);
    put(GFile, 8);
    fclose(GFile);
    M = "r";
    M = M + "";
    f = fopen(P1, M);
    while (!eof(f)) {
        readln(f, line);
        printf("%s\n", line);
    }
    fclose(f);
    f = fopen(P2, M);
    while (!eof(f)) {
        readln(f, line);
        printf("%s\n", line);
    }
    fclose(f);
    assign(f, P1);
    remove(f);
    assign(f, P2);
    remove(f);
    return 0;
}
