import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

const double _kPickerItemHeight = 32.0;

class PlatformDropdownButton extends PlatformWidget<Widget, Widget> {
  final String hint;
  final ValueChanged<int> onChanged;
  final List<String> items;
  final int selectedIndex;
  final String error;

  PlatformDropdownButton({
    @required this.onChanged,
    @required this.items,
    @required this.selectedIndex,
    this.hint,
    this.error,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return _createWidget(
      context,
      Border.all(color: Colors.grey),
      12.0,
      null,
      () {
        FocusScope.of(context).requestFocus(FocusNode());
        _showAlertDialog(context);
      },
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return _createWidget(
      context,
      Border.all(
        color: CupertinoColors.lightBackgroundGray,
        width: 1.0,
      ),
      8.0,
      Colors.white,
      () {
        FocusScope.of(context).requestFocus(FocusNode());
        _showCupertinoPicker(context);
      },
    );
  }

  Widget _createWidget(BuildContext context, BoxBorder boxBorder,
      double padding, Color color, GestureTapCallback onTap) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 2.0),
          child: Container(
            width: double.infinity,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: boxBorder,
              borderRadius: BorderRadius.circular(4.0),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, padding, 10.0, padding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedIndex < 0 ? hint ?? '' : items[selectedIndex],
                      style: selectedIndex < 0
                          ? Theme.of(context)
                              .textTheme
                              .subhead
                              .apply(color: Colors.grey)
                          : Theme.of(context).textTheme.subhead,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
        ErrorText(error),
      ],
    );
  }

  _showCupertinoPicker(BuildContext context) async {
    var scrollController = FixedExtentScrollController(
        initialItem: selectedIndex < 0 ? 0 : selectedIndex);
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return buildBottomPicker(
          context,
          CupertinoPicker(
            scrollController: scrollController,
            itemExtent: _kPickerItemHeight,
            backgroundColor: CupertinoColors.white,
            onSelectedItemChanged: onChanged,
            children: items.map((value) {
              return Center(child: Text(value));
            }).toList(),
          ),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tipo de orden"),
          content: _builtAlertDialogContent(),
        );
      },
    );
  }

  Widget _builtAlertDialogContent() {
    return Container(
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              Navigator.of(context).pop();
              onChanged(index);
            },
          );
        },
      ),
    );
  }
}
