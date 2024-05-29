import 'package:go_router/go_router.dart';
import 'package:trivia_app/config/router/app_routes_strings.dart';
import 'package:trivia_app/presentation/screens/index.dart';

class AppGoRouter {

  static GoRouter router(){
    return GoRouter(routes: [

      GoRoute(
        path: AppRoutesStrings.initRoute,
        name: AppRoutesStrings.initRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutesStrings.homeRoute,
        name: AppRoutesStrings.homeRoute,
        builder: (context, state) => const HomeScreen(),
      )

    ]);
    
  }
}
