part of '../calendar_page.dart';

class WeekDayWidget extends StatelessWidget {
  const WeekDayWidget({super.key, required this.dayIndex});

  final int dayIndex;

  static final _weekDays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: WeekDayTile(
        dayIndex: dayIndex,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        displayBorder: false,
        weekDayStringBuilder: (index) => _weekDays[index],
      ),
    );
  }
}
