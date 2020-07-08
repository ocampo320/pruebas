import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_text_field.dart';
import 'platform_widget.dart';

class PlatformDatePicker extends PlatformWidget<Widget, Widget> {
  final String value;
  final DateTime minDate;
  final DateTime maxDate;
  final String label;
  final String hint;
  final ValueChanged<DateTime> onDateTimeChanged;
  final String error;
  final bool disableSelectFutureDays;
  var daysAdd;

  PlatformDatePicker({
    this.value,
    this.label,
    this.minDate,
    this.maxDate,
    this.hint,
    @required this.onDateTimeChanged,
    this.error,
    this.disableSelectFutureDays = false,
    this.daysAdd,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDatePicker(context);
      },
      child: IgnorePointer(
        child: PlatformTextField(
          labelText: label,
          hintText: hint,
          controller: TextEditingController(text: value),
          errorText: error,
          suffix: Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _showCupertinoDatePicker(context);
      },
      child: IgnorePointer(
        child: PlatformTextField(
          labelText: label,
          hintText: hint,
          controller: TextEditingController(text: value),
          errorText: error,
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  _showDatePicker(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    var newDate = await showDatePicker(
        context: context,
        initialDate: minDate ?? DateTime.now(),
        firstDate: minDate ?? DateTime(2010),
        lastDate: maxDate ?? DateTime(2030),
        initialDatePickerMode: DatePickerMode.day);
    if (newDate != null) {
      onDateTimeChanged(newDate);
    }
  }

  void _showCupertinoDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    var date = minDate ?? DateTime.now();
    onDateTimeChanged(date);
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return buildBottomPicker(
          context,
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: minDate ?? DateTime.now(),
            onDateTimeChanged: onDateTimeChanged,
            minimumDate: minDate ?? DateTime(2010),
            maximumDate: maxDate ?? DateTime(2030),
          ),
        );
      },
    );
  }
}
