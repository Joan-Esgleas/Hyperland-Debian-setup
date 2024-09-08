#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void Usage(char *msg) {
  printf(msg, "\n");
  exit(EXIT_FAILURE);
}

int getVolume() {
  char buffer[128];
  int volume = 0;
  FILE *fp = popen("wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9' | sed "
                   "'s/^0\\{1,2\\}//'",
                   "r");
  if (fp == NULL) {
    printf("Failed to run command\n");
    Usage("Error en el registro de volumen");
  }
  if (fgets(buffer, sizeof(buffer), fp) != NULL) {
    volume = atoi(buffer);
  }
  if (pclose(fp) < 0)
    Usage("Error in pclose");
  return volume;
}

void VolumenNotify(const int volume) {
  char command[256];
  snprintf(command, sizeof(command),
           "dunstify -a \"Volume\" -r 9993 -h int:value:%d -i \"volume-$ICON\" "
           "\"Volume\" \"$TEXT\" -t 2000",
           volume);

  if (system(command) != 0)
    Usage("Error in wpctl notify");
}

void volume(const char *argv) {
  if (strcmp(argv, "up") == 0) {
    if (system("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0") != 0)
      Usage("Error in wpctl set-mute");
    int volume = getVolume();
    if (volume <= 100) {
      if (system("wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+") != 0)
        Usage("Error in wpctl set-volume");
      VolumenNotify(volume);
    }
  } else if (strcmp(argv, "down") == 0) {
    if (system("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0") != 0)
      Usage("Error in wpctl set-mute");
    if (system("wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%-") != 0)
      Usage("Error in wpctl set-volume");
    int volume = getVolume();
    VolumenNotify(volume);
  } else if (strcmp(argv, "mute") == 0) {
    if (system("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") != 0)
      Usage("Error in wpctl set-mute");
    int volume = getVolume();
    VolumenNotify(volume);
  } else
    Usage("Incorrect arguments expected up, down, mute");
}

int main(int argc, char **argv) {
  if (argc != 3) {
    Usage("Incorrect amount of arguments");
  }
  if (strcmp(argv[1], "-v") == 0) {
    volume(argv[2]);

  } else if (strcmp(argv[1], "-b") == 0) {

  } else {
    Usage("Incorrect arguments expected -v [volume] or -b [brightness]");
  }

  return EXIT_SUCCESS;
}
