class ScheduleEntity {
  final DateTime selectedMonthYear;

  ScheduleEntity({
    required this.selectedMonthYear,
  });

  nextMonth() {
    return ScheduleEntity(
      selectedMonthYear: DateTime(
        selectedMonthYear.year,
        selectedMonthYear.month + 1,
        1,
      ),
    );
  }

  previewsMonth() {
    return ScheduleEntity(
      selectedMonthYear: DateTime(
        selectedMonthYear.year,
        selectedMonthYear.month - 1,
        1,
      ),
    );
  }

  String get monthName => months[selectedMonthYear.month - 1];
  List<String> get months => [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];
  List<String> get daysOfWeek => [
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday",
      ];

  ScheduleEntity copyWith({
    DateTime? selectedMonthYear,
  }) {
    return ScheduleEntity(
      selectedMonthYear: selectedMonthYear ?? this.selectedMonthYear,
    );
  }

  List<DateTime> getDaysInMonth() {
    var firstDate =
        DateTime(selectedMonthYear.year, selectedMonthYear.month, 1);
    if (firstDate.weekday == DateTime.saturday) {
      firstDate = firstDate.subtract(const Duration(days: 6));
    } else if (firstDate.weekday == DateTime.friday) {
      firstDate = firstDate.subtract(const Duration(days: 5));
    } else if (firstDate.weekday == DateTime.thursday) {
      firstDate = firstDate.subtract(const Duration(days: 4));
    } else if (firstDate.weekday == DateTime.wednesday) {
      firstDate = firstDate.subtract(const Duration(days: 3));
    } else if (firstDate.weekday == DateTime.tuesday) {
      firstDate = firstDate.subtract(const Duration(days: 2));
    } else if (firstDate.weekday == DateTime.monday) {
      firstDate = firstDate.subtract(const Duration(days: 1));
    }
    var lastDate =
        DateTime(selectedMonthYear.year, selectedMonthYear.month + 1, 1)
            .subtract(const Duration(days: 1));
    if (lastDate.weekday == DateTime.sunday) {
      lastDate = lastDate.add(const Duration(days: 6));
    } else if (lastDate.weekday == DateTime.monday) {
      lastDate = lastDate.add(const Duration(days: 5));
    } else if (lastDate.weekday == DateTime.tuesday) {
      lastDate = lastDate.add(const Duration(days: 4));
    } else if (lastDate.weekday == DateTime.wednesday) {
      lastDate = lastDate.add(const Duration(days: 3));
    } else if (lastDate.weekday == DateTime.thursday) {
      lastDate = lastDate.add(const Duration(days: 2));
    } else if (lastDate.weekday == DateTime.friday) {
      lastDate = lastDate.add(const Duration(days: 1));
    }
    List<DateTime> days = [];
    while (
        firstDate.isBefore(lastDate) || firstDate.isAtSameMomentAs(lastDate)) {
      days.add(firstDate);
      firstDate = firstDate.add(const Duration(days: 1));
    }
    return days;
  }

  @override
  String toString() => "$monthName - ${selectedMonthYear.year}";
}
