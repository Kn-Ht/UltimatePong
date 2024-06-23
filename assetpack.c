#include "src/rl.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//! assetpack.c: Transform binary data into an array of bytes using CompressData()

#define ERROR(MSG, ...) fprintf(stderr, "ERROR:"MSG"\n", ##__VA_ARGS__)

void help(const char* program) {
    printf("%s [compress/normal] <in> <out>\n", program);
}

int main(int argc, char** argv) {
    const char* program = argv[0];

    if (argc != 4) {
        ERROR("Please provide 2 arguments in the form '<in file> <out file>.");
        help(program);
        return 1;
    }

    bool compress = false;

    if (strcmp(argv[1], "compress") == 0) {
        compress = true;
    } else if (strcmp(argv[1], "normal") == 0) {
        compress = false;
    } else {
        ERROR("Unkown compression type '%s'.", argv[1]);
        help(program);
        return 1;
    }

    const char* in_path = argv[2];
    const char* out_path = argv[3];

    i32 data_size;
    u8* data = LoadFileData(in_path, &data_size);

    if (compress) {
        i32 data_comp_size;
        CompressData(data, data_size, &data_comp_size);
        data_size = data_comp_size;
    }

    char out_path_complete[_MAX_PATH];
    snprintf(out_path_complete, sizeof(out_path_complete), "src/assets/%s", out_path);

    ExportDataAsCode(data, data_size, out_path_complete);
    UnloadFileData(data);

    printf("\nExported data to '%s'\n", out_path_complete);

    return 0;
}