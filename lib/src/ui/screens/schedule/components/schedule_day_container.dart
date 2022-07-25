import 'package:flutter/material.dart';
class ScheduleDayContainer extends StatelessWidget {
  const ScheduleDayContainer({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.addDateToRange,
    required this.isToday,
     this.isDatePassed=false,
  }) : super(key: key);

  final bool isSelected;
  final DateTime date;
  final Function(DateTime date) addDateToRange;
  final bool isDatePassed;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDatePassed ? null : () => addDateToRange(date),
      child: Container(
        color: _changeBackgroundColor(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              decoration: BoxDecoration(
                color: _changeBoxColor(),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: Text(
                date.day.toString(),
                style: TextStyle(
                  color: _changeColorText(),
                  fontSize: _changeFontSize(),
                  fontWeight: _changeFontWeight(),
                  fontStyle: _changeFontStyle(),
                ),
              ))),
        ),
      ),
    );
  }

  _changeBoxColor() {
    if (isToday) return Colors.blue.withAlpha(100);
    return Colors.transparent;
  }

  _changeBackgroundColor() {
    if (isSelected) return Colors.grey.withAlpha(100);
    return Colors.transparent;
  }

  _changeColorText() {
    if (isSelected && isToday) return Colors.white;
    return Colors.black;
  }

  double _changeFontSize() {
    if (isSelected) return 18;
    return 16;
  }

  _changeFontWeight() {
    if (isToday) return FontWeight.bold;
    return FontWeight.w600;
  }

  _changeFontStyle() {
    if (isToday) return FontStyle.italic;
    return FontStyle.normal;
  }
}
