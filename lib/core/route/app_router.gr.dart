// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:base_project/features/cards/ui/pages/wallet_page.dart' as _i2;
import 'package:base_project/features/test/ui/pages/test_page.dart' as _i1;

/// generated route for
/// [_i1.TestPage]
class TestPage extends _i3.PageRouteInfo<void> {
  const TestPage({List<_i3.PageRouteInfo>? children})
    : super(TestPage.name, initialChildren: children);

  static const String name = 'TestPage';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.TestPage();
    },
  );
}

/// generated route for
/// [_i2.WalletPage]
class WalletPage extends _i3.PageRouteInfo<void> {
  const WalletPage({List<_i3.PageRouteInfo>? children})
    : super(WalletPage.name, initialChildren: children);

  static const String name = 'WalletPage';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.WalletPage();
    },
  );
}
