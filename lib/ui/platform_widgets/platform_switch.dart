import 'package:app/ui/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSwitch extends PlatformWidget<Widget, Widget> {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  PlatformSwitch({
    @required this.value,
    @required this.onChanged,
    this.activeColor,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
      ),
    );
  }
}
