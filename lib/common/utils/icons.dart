import 'package:flutter/widgets.dart';

@immutable
class UiIconsData extends IconData {
  const UiIconsData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'UiIcons',
        );
}

@immutable
class UiIcons {
  UiIcons._();

  // Generated code: do not hand-edit.
  static const IconData beauty = UiIconsData(0xe000);

  static const IconData decor = UiIconsData(0xe001);

  static const IconData electrician = UiIconsData(0xe002);

  static const IconData event = UiIconsData(0xe003);

  static const IconData flame = UiIconsData(0xe004);

  static const IconData healthcare = UiIconsData(0xe005);

  static const IconData logo = UiIconsData(0xe006);

  static const IconData maintenance = UiIconsData(0xe007);

  static const IconData plumbing = UiIconsData(0xe008);

  static const IconData woodwork = UiIconsData(0xe009);
}
