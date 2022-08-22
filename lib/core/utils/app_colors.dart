import 'package:flutter/material.dart';
import 'package:quotes/core/utils/hex_color.dart';
import 'custome_material_color.dart';

class AppColors {
  static final Color primary = HexColor('#202053');
  static final Color random = HexColor('#451BAB');
  static final MaterialColor primaryMaterial =
      CustomMaterialColor(primary).color;
}
