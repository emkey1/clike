// A function may call one defined further down the file, as in C.
int twice(int x);

int a() { return b(2); }

int isEven(int n) {
  if (n == 0) return 1;
  return isOdd(n - 1);
}

int main() {
  printf("%d\n", a());
  printf("%d\n", twice(21));
  printf("%d %d\n", isEven(10), isEven(7));
  greet("later");
  printf("%s\n", shout("up"));
  return 0;
}

int b(int x) { return x * 3; }

int twice(int x) { return x * 2; }

int isOdd(int n) {
  if (n == 0) return 0;
  return isEven(n - 1);
}

void greet(str who) { printf("hello %s\n", who); }

str shout(str s) { return s + "!"; }
