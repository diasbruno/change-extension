#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int count, char* args[]) {
  if (count != 3) {
      exit(1);
      return 1;
  }

  const char* const extension = args[1];
  if (extension == 0 || strlen(extension) == 0) {
    exit(1);
    return 1;
  }

  const char* const file = args[2];
  if (file == 0 || strlen(file) == 0) {
    exit(1);
    return 1;
  }

  size_t length_of_extension_name = strlen(extension);
  size_t length_of_file_name = strlen(file);

  const char* pos = strrchr(file, '.');

  size_t dot_position = pos - file;
  size_t length = dot_position
    + 1 /* dot */
    + length_of_extension_name
    + 1 /* null */;
  char* new_file = malloc(length);
  memcpy(new_file, file, dot_position);
  new_file[pos - file] = '.';
  memcpy(new_file + (1 + dot_position), extension, length_of_extension_name);

  printf("%s", new_file);

  return 0;
}
