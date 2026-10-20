struct P { int x; int y; };
struct P g;
struct P h;

void f(struct P p) {
    p.x = 9;
    p.y = p.y + 1;
    printf("in f %d %d\n", p.x, p.y);
}

void bump(struct P* q) {
    q->x = q->x + 100;
}

int main() {
    struct P a;
    g.x = 1;
    g.y = 2;
    f(g);
    printf("g after f %d %d\n", g.x, g.y);
    h = g;
    f(h);
    printf("h after f %d %d\n", h.x, h.y);
    g.x = 7;
    printf("g %d h %d\n", g.x, h.x);
    a = g;
    bump(&a);
    printf("g %d a %d\n", g.x, a.x);
    return 0;
}
