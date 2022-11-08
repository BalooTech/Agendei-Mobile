import 'package:agendei/wave_ds/components/calendar_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalendarRow extends StatelessWidget {
  const CalendarRow({super.key});

  final CalendarViewModel _viewModel = const CalendarViewModel();

  @override
  Widget build(BuildContext context) {
    final dateData = _viewModel.getNext30Days();

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return CalendarCell(
          day: dateData[index].day,
          weekday: dateData[index].weekday.toWeekdayName(),
          month: dateData[index].month.toMonthName(),
          mode: index == 0 ? CalendarCellMode.selected : null,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: _viewModel.daysRange,
    );
  }

  void printNextSevenDays() {
    print(DateTime.now());
  }
}

class CalendarViewModel {
  final int daysRange = 30;

  const CalendarViewModel();

  List<CalendarCellModel> getNext30Days() {
    final today = DateTime.now();

    final List<CalendarCellModel> result = [];

    for (var i = 0; i < daysRange; i++) {
      final newDate = today.add(Duration(days: i));

      result.add(
        CalendarCellModel(
          month: newDate.month.toString(),
          day: newDate.day.toString(),
          weekday: newDate.weekday.toString(),
        ),
      );
    }

    return result;
  }
}

class CalendarCellModel {
  final String month;
  final String day;
  final String weekday;

  CalendarCellModel({
    required this.month,
    required this.day,
    required this.weekday,
  });
}

enum Month {
  jan,
  fev,
  mar,
  abr,
  mai,
  jun,
  jul,
  aug,
  set,
  out,
  nov,
  dez;
}

enum Weekday {
  seg,
  ter,
  qua,
  qui,
  sex,
  sab,
  dom;
}

extension StringExt on String {
  String toMonthName() {
    final monthNum = int.parse(this);
    return Month.values[monthNum-1].name;
  }

  String toWeekdayName() {
    final weekdayNum = int.parse(this);
    return Weekday.values[weekdayNum-1].name;
  }
}
