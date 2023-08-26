part of 'page_route.dart';

class Route {
  final Bindings binding;
  final Widget page;
  final String path;

  Route({required this.binding, required this.page, required this.path});
}

class Routes {
  static final Route home = Route(
    binding: HomeBinding(),
    page: HomeScreen(),
    path: Path.home,
  );
}

class Path {
  static const String home = "/home";
}
