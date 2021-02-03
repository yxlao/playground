#include <initializer_list>
#include <iostream>
#include <type_traits>

class Scalar {
    int i_;
    float f_;
    Scalar(int i) { i_ = i; }
    Scalar(float f) { f_ = f; }
};

template <typename T = Scalar>
void constructor(std::initializer_list<T> a) {
    static_assert(std::is_same<T, Scalar>(), "Type must be Scalar.");
    std::cout << "constructor 1D" << std::endl;
}

template <typename T = Scalar>
void constructor(std::initializer_list<std::initializer_list<T>> a) {
    static_assert(std::is_same<T, Scalar>(), "Type must be Scalar.");
    std::cout << "constructor 2D" << std::endl;
}

template <typename T = Scalar>
void constructor(
        std::initializer_list<std::initializer_list<std::initializer_list<T>>>
                a) {
    static_assert(std::is_same<T, Scalar>(), "Type must be Scalar.");
    std::cout << "constructor 3D" << std::endl;
}

int main() {
    constructor({});        // 3D
    constructor({{}, {}});  // 3D
    return 0;
}
