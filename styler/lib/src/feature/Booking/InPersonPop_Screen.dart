import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/feature/Booking/InPerson_Consultation_Screen.dart';
import 'package:styler/src/feature/Booking/booking_page.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:table_calendar/table_calendar.dart';

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

class CalendarPopup extends ConsumerWidget {
  const CalendarPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    DateTime focusedDay = DateTime.now();
    DateTime? tempSelectedDate = ref.watch(selectedDateProvider);

    return Material(
      color: Colors.transparent, // Make the Material widget transparent
      child: FractionallySizedBox(
        heightFactor: 0.5, // Adjusted height for better responsiveness
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color for the modal content
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    mediaQuery.size.width * 0.05, // Adaptive horizontal padding
                vertical:
                    mediaQuery.size.height * 0.02, // Adaptive vertical padding
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(tempSelectedDate, day),
                    onDaySelected: (selectedDay, newFocusedDay) {
                      ref.read(selectedDateProvider.notifier).state =
                          selectedDay;
                      focusedDay = newFocusedDay;
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(selectedDateProvider.notifier).state = null;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookingScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text('Reset'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InPersonConsultationFinalScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showCalendarPopup(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor:
        Colors.transparent, // Make the bottom sheet background transparent
    builder: (context) => const CalendarPopup(),
  );
}
