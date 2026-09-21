#include <stdio.h>
#include <stdlib.h>
#include "../include/mystfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");

    char str1[100] = "Hello";
    char str2[100] = "World";
    char dest[100];

    printf("Length of '%s': %d\n", str1, mystrlen(str1));

    mystrcpy(dest, str1);
    printf("Copy '%s' to dest: '%s'\n", str1, dest);

    mystrncpy(dest, str2, 3);
    printf("Copy first 3 of '%s': '%s'\n", str2, dest);

    mystrcat(str1, " ");
    mystrcat(str1, str2);
    printf("Concatenated: '%s'\n", str1);

    printf("\n--- Testing File Functions ---\n");

    FILE* fp = fopen("test.txt", "r");
    if (fp == NULL) {
        printf("Error: Could not open test.txt\n");
        return 1;
    }

    int lines, words, chars;
    wordCount(fp, &lines, &words, &chars);
    printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);

    rewind(fp);

    char* matches[100];
    int match_count = mygrep(fp, "the", matches);
    printf("Found %d lines containing 'the':\n", match_count);
    for (int i = 0; i < match_count; i++) {
        printf("  %s", matches[i]);
        free(matches[i]);
    }

    fclose(fp);
    return 0;
}
