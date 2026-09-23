# Operating Systems Assignment 1

**Name:** Hifza Zia
**Roll No:** BSDSF24M034
**Repository:** https://github.com/HifzaZia-hub/BSDSF24M034-OS-A01

## Part 2: Multi-file Project

**Q1:** Explain the linking rule `$(TARGET): $(OBJ)`.

**Answer:** The rule says the target (executable) depends on all the object files listed in `$(OBJ)`. The linker combines them into one executable. This is direct linking. In contrast, a library linking rule only needs the main object file and the library file. The linker extracts needed functions from the library.

**Q2:** What is a git tag? Simple vs annotated?

**Answer:** A git tag is a label on a specific commit used for marking releases. A simple tag is just a pointer. An annotated tag contains extra metadata (tagger name, date, message) and is recommended for official releases.

**Q3:** Purpose of GitHub Release? Significance of attaching binaries?

**Answer:** A Release packages a specific version for distribution. Attaching binaries lets users download the compiled program without needing to compile it themselves.

## Part 3: Static Library

**Q1:** Compare Makefiles from Part 2 and Part 3.

**Answer:** Part 2 links all object files directly. Part 3 creates a static library (`.a`) using `ar rcs` and then links only `main.o` against it using `-L` and `-l` flags.

**Q2:** Purpose of `ar`? Why `ranlib`?

**Answer:** `ar` creates static libraries. `ranlib` adds a symbol index for faster linking. Modern `ar` does this automatically with the `s` flag.

**Q3:** Are symbols like `mystrlen` present in `client_static`?

**Answer:** Yes. Running `nm client_static` shows `T mystrlen`, meaning the code was copied into the executable at link time.

## Part 4: Dynamic Library

**Q1:** What is `-fPIC` and why needed?

**Answer:** Position-Independent Code. It allows the library to be loaded at any memory address. Required for shared libraries because they are loaded at runtime at unpredictable addresses.

**Q2:** Difference in file size?

**Answer:** `client_static` is larger because it contains the library code. `client_dynamic` is smaller because it only references the library, which is loaded at runtime.

**Q3:** What is `LD_LIBRARY_PATH`?

**Answer:** An environment variable that tells the dynamic loader where to look for shared libraries. Needed because our custom `libmyutils.so` is not in the standard system directories.

## Conclusion

This assignment demonstrated modular programming, Makefiles, static/dynamic libraries, man pages, and Git workflows.
