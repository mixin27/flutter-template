import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next();
    // const isAuthenticated = true;
    // if (isAuthenticated) {
    //   resolver.next();
    // } else {
    //   router.replaceAll([const HomeRoute()]);
    // }
  }
}
