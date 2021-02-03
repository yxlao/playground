#include <initializer_list>
#include <iostream>

template <typename T = int>
void constructor_T(std::initializer_list<T> l) {
    std::cout << "constructor_T 1D" << std::endl;
}

template <typename T = int>
void constructor_T(std::initializer_list<std::initializer_list<T>> ll) {
    std::cout << "constructor_T 2D" << std::endl;
}

void constructor_int(std::initializer_list<int> l) {
    std::cout << "constructor_int 1D" << std::endl;
}

void constructor_int(std::initializer_list<std::initializer_list<int>> ll) {
    std::cout << "constructor_int 2D" << std::endl;
}

int main() {
    constructor_T({});                // constructor_T 2D
    constructor_T({{}, {}});          // constructor_T 2D
    constructor_T({1, 2, 3, 4});      // constructor_T 1D
    constructor_T({{1, 2}, {3, 4}});  // constructor_T 2D

    // constructor_int({});                // ambiguous, why?
    // constructor_int({{}, {}});          // ambiguous, why?
    constructor_int({1, 2, 3, 4});      // constructor_int 1D
    constructor_int({{1, 2}, {3, 4}});  // constructor_int 2D

    return 0;
}
