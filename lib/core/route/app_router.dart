import 'package:base_project/so_like_app.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CardsPage.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: WalletPage.page,
          path: '/wallet',
        ),
        AutoRoute(page: TestPage.page, path: '/test'),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
