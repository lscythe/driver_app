import 'package:driver_app/domain/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestLeaveDialog extends StatefulWidget {
  const RequestLeaveDialog({
    super.key,
    required this.dateController,
    required this.dayController,
    required this.date,
    required this.leaveType,
  });

  final TextEditingController dateController;
  final TextEditingController dayController;
  final ValueChanged<String> leaveType;
  final DateTime date;

  @override
  State<RequestLeaveDialog> createState() => _RequestLeaveDialogState();
}

class _RequestLeaveDialogState extends State<RequestLeaveDialog> {
  late TextEditingController _dateController;
  late TextEditingController _dayController;

  final _leaveType = ["Annual Leave", "Sick Leave", "Unpaid Leave"];
  late String _selectedType;

  @override
  void initState() {
    super.initState();
    _dateController = widget.dateController;
    _dayController = widget.dayController;
    _selectedType = _leaveType.first;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            GestureDetector(
              onTap: () {},
              child: _leaveTypeField(),
            ),
            _leaveDateField(),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Days",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            _leaveDayField(),
            _actionButtonField(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Request Leave",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close),
            )
          ],
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _leaveTypeField() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Leave Type",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xFFf2f2f2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      _selectedType,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF939393),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _leaveDateField() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Leave Date",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xFFf2f2f2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: Text(
                DateFormat("dd-MMM-yyyy").format(widget.date),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFc3c3c3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _leaveDayField() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFFf2f2f2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
          controller: _dayController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Leave Days",
          )),
    );
  }

  Widget _actionButtonField() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Divider(
            height: 2,
            thickness: 2,
            color: Color(0xFFf2f2f2),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 20,
              color: Colors.black,
              indent: 20,
              endIndent: 0,
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF6973a3)),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
