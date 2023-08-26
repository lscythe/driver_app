part of '../calendar_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.date,
    required this.onChevronRightTap,
    required this.onChevronLeftTap,
  });

  final DateTime date;
  final VoidCallback onChevronRightTap;
  final VoidCallback onChevronLeftTap;

  static final _dateFormatter = DateFormat.yMMM();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _dateFormatter.format(date),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onChevronLeftTap,
                  icon: const Icon(Icons.chevron_left)),
              IconButton(
                  onPressed: onChevronRightTap,
                  icon: const Icon(Icons.chevron_right))
            ],
          )
        ],
      ),
    );
  }
}
