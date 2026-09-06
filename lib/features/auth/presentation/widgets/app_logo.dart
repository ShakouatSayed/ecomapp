import 'package:ecomapp/app/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 100, this.height = 100});

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.logoSvg,
      width: width,
      height: height,
      fit: .scaleDown,
    );
  }
}
