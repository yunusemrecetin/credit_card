// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:base_project/features/cards/ui/pages/cards_page.dart' as _i1;
import 'package:base_project/features/cards/ui/pages/wallet_page.dart' as _i3;
import 'package:base_project/features/test/ui/pages/test_page.dart' as _i2;

/// generated route for
/// [_i1.CardsPage]
class CardsPage extends _i4.PageRouteInfo<void> {
  const CardsPage({List<_i4.PageRouteInfo>? children})
    : super(CardsPage.name, initialChildren: children);

  static const String name = 'CardsPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CardsPage();
    },
  );
}

/// generated route for
/// [_i2.TestPage]
class TestPage extends _i4.PageRouteInfo<void> {
  const TestPage({List<_i4.PageRouteInfo>? children})
    : super(TestPage.name, initialChildren: children);

  static const String name = 'TestPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.TestPage();
    },
  );
}

/// generated route for
/// [_i3.WalletPage]
class WalletPage extends _i4.PageRouteInfo<void> {
  const WalletPage({List<_i4.PageRouteInfo>? children})
    : super(WalletPage.name, initialChildren: children);

  static const String name = 'WalletPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.WalletPage();
    },
  );
}
