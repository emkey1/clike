// A one-letter mode such as "w" is a char literal; fopen takes it as a string.
int main() {
  text f;
  str line;
  f = fopen("fopen_char_mode.txt", "w");
  fprintf(f, "written %d\n", 1);
  fclose(f);
  f = fopen("fopen_char_mode.txt", "r");
  readln(f, line);
  printf("%s\n", line);
  fclose(f);
  assign(f, "fopen_char_mode.txt");
  remove(f);
  return 0;
}
