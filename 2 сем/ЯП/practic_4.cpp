#include <iostream>
#include <vector>
#include <set>

int sqc(std::vector<double> va, std::vector<double> vb) {
    if (va[0] * vb[1] - vb[0] * va[1] < 0) {
        return -1;
    }
    return 1;
}

void main() {
    setlocale(LC_ALL, "Russian");

    std::cout << "координаты вершин через Enter: " << std::endl;
    std::vector<std::vector<double>> line;
    for (int i = 0; i < 3; i++) {
        std::vector<double> coordinates;
        double x, y;
        std::cin >> x >> y;
        coordinates.push_back(x);
        coordinates.push_back(y);
        line.push_back(coordinates);
    }
    std::cout << "координаты точки через Enter: " << std::endl;
    std::vector<double> point;
    double px, py;
    std::cin >> px >> py;
    point.push_back(px);
    point.push_back(py);
    std::vector<std::vector<double>> vect;
    for (int i = 0; i < 3; i++) {
        std::vector<double> vector;
        vector.push_back(line[i][0] - point[0]);
        vector.push_back(line[i][1] - point[1]);
        vect.push_back(vector);
    }
    std::vector<int> ch;
    ch.push_back(sqc(vect[0], vect[2]));
    for (int i = 1; i < 3; i++) {
        ch.push_back(sqc(vect[i], vect[i - 1]));
    }
    if (std::set<int>(ch.begin(), ch.end()).size() == 1) {
        std::cout << "YES" << std::endl;
    }
    else {
        std::cout << "NO" << std::endl;
    }
}

