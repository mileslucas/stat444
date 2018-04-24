#include <stdio.h>
#include <iostream>
#include <vector>
#include <string>
#include <diamonds>

int main(int argc, char * argv[]) {
    unsigned long int Nrows, Ncols;
    ifstream inputFile;
    File::openInputFile(inputFile, "localPath.txt");
    File::sniffFile(inputFile, Nrows, Ncols);
    vector<string> myLocalPath;
    myLocalPath = File::vectorStringFromFile(inputFile, Nrows);
    inputFile.close();

    return 0;
}