#include <stdint.h>
#include <stdio.h>
#include <syslog.h>

int main(int argc, char **argv) {
  if (argc < 3) {
    syslog(LOG_ERR, "Please provide filename and text.");
    return 1;
  }

  const uint32_t filename_index = 1u;
  const uint32_t text_index = 2u;

  char *filename = argv[filename_index];
  char *text = argv[text_index];

  FILE *file = fopen(filename, "w");

  if (NULL == file) {
    syslog(LOG_ERR, "Cannot open the file.");

    return 1;
  }

  syslog(LOG_DEBUG, "Writing %s to %s", filename, text);

  fprintf(file, "%s", text);

  fclose(file);

  return 0;
}