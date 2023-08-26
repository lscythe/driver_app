import 'package:driver_app/domain/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestLeaveDialog extends StatelessWidget {
  const RequestLeaveDialog({
    super.key,
    required this.dateController,
    required this.dayController,
    required this.date,
  });

  final TextEditingController dateController;
  final TextEditingController dayController;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Request Leave",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: ScheduleStatus.leave,
                  child: Text("Annual Leave"),
                ),
                DropdownMenuItem(
                  value: ScheduleStatus.sickLeave,
                  child: Text("Sick Leave"),
                ),
                DropdownMenuItem(
                  value: ScheduleStatus.unpaidLeave,
                  child: Text("Unpaid Leave"),
                ),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Leave Type",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: dateController,
              enabled: false,
              textAlign: TextAlign.center,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: DateFormat("dd-MMM-yyyy").format(date),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: dayController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Leave Day",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Submit"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
