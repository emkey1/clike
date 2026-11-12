// delete, insert, move, assigned and gettickcount are Pascal's builtins only;
// a CLike program can name its own functions after them.
int delete(int x) { return x - 1; }
int insert(int x) { return x + 1; }
int move(int a, int b) { return a * b; }
int assigned(int x) { return x != 0; }
int gettickcount() { return 7; }
int main() {
    printf("%d %d %d %d %d\n", delete(5), insert(5), move(3, 4), assigned(2), gettickcount());
    return 0;
}
