// Assigning a whole struct or array keeps its storage, so a pointer to one
// of its fields or elements still points into it afterwards (C semantics).
struct P { int x; int y; };
struct P g;
struct P gb;
int main() {
  struct P a;
  struct P b;
  b.x = 10; b.y = 20;
  a.x = 1;
  int* p = &a.x;
  a = b;
  *p = 7;
  printf("%d %d\n", a.x, a.y);
  gb.x = 30; gb.y = 40;
  g.x = 2;
  int* q = &g.x;
  g = gb;
  *q = 8;
  printf("%d %d\n", g.x, g.y);
  int arr[3];
  int brr[3];
  brr[0] = 5; brr[1] = 6; brr[2] = 7;
  int* r = &arr[1];
  arr = brr;
  *r = 9;
  printf("%d %d %d\n", arr[0], arr[1], arr[2]);
  return 0;
}
