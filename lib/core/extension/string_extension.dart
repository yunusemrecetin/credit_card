import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension StringExt on String {
  SvgPicture svg({
    Key? key,
    SVGType svgType = SVGType.network,
    matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    width,
    height,
    fit = BoxFit.contain,
    alignment = Alignment.center,
    allowDrawingOutsideViewBox = false,
    placeholderBuilder,
    semanticsLabel,
    excludeFromSemantics = false,
    clipBehavior = Clip.hardEdge,
    theme = const SvgTheme(),
  }) {
    switch (svgType) {
      case SVGType.asset:
        return SvgPicture.network(
          this,
          fit: fit,
          alignment: alignment,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          matchTextDirection: matchTextDirection,
          height: height,
          width: width,
          placeholderBuilder: placeholderBuilder,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics,
          clipBehavior: clipBehavior,
          theme: theme,
        );
      case SVGType.network:
        return SvgPicture.asset(
          this,
          fit: fit,
          alignment: alignment,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          bundle: bundle,
          matchTextDirection: matchTextDirection,
          height: height,
          width: width,
          placeholderBuilder: placeholderBuilder,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics,
          clipBehavior: clipBehavior,
          theme: theme,
          package: package,
        );
    }
  }
}
