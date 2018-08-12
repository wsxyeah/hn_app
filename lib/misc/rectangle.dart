class Point {
  const Point(double x, double y);
}

class Rectangle {
  Point origin;
  double width;
  double height;

  Rectangle({this.origin: const Point(0.0, 0.0), this.width = 0.0, this.height = 0.0});
}