library designsys;

// Packages
export 'package:flutter/material.dart';
export 'package:flutter_feather_icons/flutter_feather_icons.dart';
export 'package:page_transition/page_transition.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:iconsax/iconsax.dart';

// Src
export 'src/styled_components/styled_components.dart';
export 'src/methods.dart';
export 'src/app.dart';

// Config
export 'config/themes/light_theme/light_theme.dart';
export 'config/themes/light_theme/light_color_palette.dart';
export 'config/themes/dark_theme/dark_color_palette.dart';
export 'config/themes/dark_theme/dark_theme.dart';
export 'config/themes/text_themes/desktop_text_theme.dart';
export 'config/themes/text_themes/mobile_text_theme.dart';
export 'config/providers/theme_provider.dart';
export 'config/constants.dart';

//responsive sizes
export 'responsive/orientation_layout.dart';
export 'responsive/responsive_builder.dart';
export 'responsive/screen_type_layout.dart';
export 'utils/ui_helpers.dart';
export 'package:designsys/responsive/responsive.dart';
export 'package:designsys/responsive/split_viewer.dart';

// Assets
export 'assets/icons/iconly_icon.dart';
export 'assets/icons/iconly_bold.dart';
export 'assets/icons/iconly_line.dart';
export 'assets/icons/iconly_curved.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
