#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

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

void BrightessNotify(const int currentBrightess, const int maxBrigtess) {
  char command[256];
  int brightnessxcent = (currentBrightess * 100) / maxBrigtess;
  snprintf(
      command, sizeof(command),
      "dunstify -a \"Brightess\" -r 9995 -h int:value:%d -i \"volume-$ICON\" "
      "\"Brightess\" \"$TEXT\" -t 2000",
      brightnessxcent);

  if (system(command) != 0)
    Usage("Error in Brightess notify");
}

void setBrightess(const int newBrightess) {
  FILE *file;
  file = fopen("/sys/class/backlight/intel_backlight/brightness", "w");
  if (file == NULL) {
    Usage("Error opening file.");
  }
  fprintf(file, "%d\n", newBrightess);
  if (fclose(file) != 0)
    Usage("Error en fcloseSet");
}

int getMaxBrightess() {
  FILE *file;
  int nBrightess;
  file = fopen("/sys/class/backlight/intel_backlight/max_brightness", "r");
  if (file == NULL) {
    Usage("Error opening file.");
  }
  fscanf(file, "%d", &nBrightess);
  if (fclose(file) != 0)
    Usage("Error en fcloseMax");
  return nBrightess;
}

int getCurrentBrightess() {
  FILE *file;
  int nBrightess;
  file = fopen("/sys/class/backlight/intel_backlight/brightness", "r");
  if (file == NULL) {
    Usage("Error opening file.");
  }
  fscanf(file, "%d", &nBrightess);
  if (fclose(file) != 0)
    Usage("Error en fcloseCurrent");
  return nBrightess;
}

void brightness(const char *argv) {
  int maxBrigtess = getMaxBrightess();
  int currentBrightess = getCurrentBrightess();
  int changeAmount = 5;

  if (strcmp(argv, "up") == 0) {
    if (currentBrightess < maxBrigtess) {
      currentBrightess = MIN(
          (currentBrightess + maxBrigtess * changeAmount / 100), maxBrigtess);

      setBrightess(currentBrightess);
      BrightessNotify(currentBrightess, maxBrigtess);
    }
  } else if (strcmp(argv, "down") == 0) {
    if (currentBrightess > 0) {
      currentBrightess = MAX(
          (currentBrightess - ((maxBrigtess * changeAmount) / 100)), 0);
      setBrightess(currentBrightess);
      BrightessNotify(currentBrightess, maxBrigtess);
    }
  } else
    Usage("Incorrect arguments expected up, down");
}

int main(int argc, char **argv) {
  if (argc != 3) {
    Usage("Incorrect amount of arguments");
  }
  if (strcmp(argv[1], "-v") == 0) {
    volume(argv[2]);

  } else if (strcmp(argv[1], "-b") == 0) {
    brightness(argv[2]);
  } else {
    Usage("Incorrect arguments expected -v [volume] or -b [brightness]");
  }

  return EXIT_SUCCESS;
}
