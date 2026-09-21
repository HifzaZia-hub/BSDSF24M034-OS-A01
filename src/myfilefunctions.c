#include "../include/myfilefunctions.h"
#include <stdlib.h>
#include <string.h>

// Count lines, words, and characters in a file.
int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (file == NULL) return -1;

    *lines = 0;
    *words = 0;
    *chars = 0;

    int c;
    int in_word = 0;

    while ((c = fgetc(file)) != EOF) {
        (*chars)++;

        if (c == '\n') {
            (*lines)++;
        }

        if (c == ' ' || c == '\t' || c == '\n' || c == '\r') {
            in_word = 0;
        } else if (in_word == 0) {
            in_word = 1;
            (*words)++;
        }
    }

    return 0;
}

// Search for lines containing search_str in a file.
int mygrep(FILE* fp, const char* search_str, char** matches) {
    if (fp == NULL || search_str == NULL || matches == NULL) return -1;

    char buffer[1024];
    int count = 0;

    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        if (strstr(buffer, search_str) != NULL) {
            matches[count] = strdup(buffer);
            count++;
        }
    }

    return count;
}
