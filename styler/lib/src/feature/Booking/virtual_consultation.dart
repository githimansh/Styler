import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:table_calendar/table_calendar.dart';

// State Providers for Riverpod
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedTimeProvider = StateProvider<String?>((ref) => null);

class VirtualConsultationScreen extends StatefulWidget {
  const VirtualConsultationScreen({super.key});

  @override
  _VirtualConsultationScreenState createState() =>
      _VirtualConsultationScreenState();
}

class _VirtualConsultationScreenState extends State<VirtualConsultationScreen> {
 final List<String> availableTimes = ["1:00pm", "3:00pm", "5:00pm", "7:00pm"];

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueAccent);
    final subtitleStyle = TextStyle(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual Consultation"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final selectedDate = ref.watch(selectedDateProvider);
          final selectedTime = ref.watch(selectedTimeProvider);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Duration and Benefits
                  Text("Duration: Typically 30-45 Minutes", style: titleStyle),
                  const SizedBox(height: 8),
                  Text("Benefits:", style: subtitleStyle),
                  _buildBulletPoints([
                    "Convenience of joining from anywhere without the need to travel.",
                    "Flexible scheduling options.",
                    "No physical presence required—perfect for remote clients.",
                    "Quick, efficient consultations without time lost to commuting."
                  ]),
                  const SizedBox(height: 8),
                  Text("Ideal For:", style: subtitleStyle),
                  _buildBulletPoints([
                    "Clients with busy schedules or those located in different regions.",
                    "Those who prefer digital communication through video or phone calls."
                  ]),

                  const SizedBox(height: 16),
                  Text("Schedules", style: titleStyle.copyWith(fontSize: 18)),

                  // Calendar Widget
                  TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 30)),
                    focusedDay: selectedDate,
                    selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                    onDaySelected: (selectedDay, focusedDay) {
                      ref.read(selectedDateProvider.notifier).state =
                          selectedDay;
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.blue[200],
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text("Available Time",
                      style: titleStyle.copyWith(fontSize: 18)),

                  // Time Slots
                  Wrap(
                    spacing: 12,
                    children: availableTimes.map((time) {
                      return ChoiceChip(
                        label: Text(time),
                        selected: selectedTime == time,
                        onSelected: (isSelected) {
                          ref.read(selectedTimeProvider.notifier).state =
                              isSelected ? time : null;
                        },
                        selectedColor: Colors.blueAccent,
                        labelStyle: TextStyle(
                          color: selectedTime == time
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),
                  // Promo Discounts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPromoCard("50% off", "Use code FREE50"),
                      _buildPromoCard(
                          "60% off on Debit Card", "No coupon required"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Promo Discounts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPromoCard("50% off", "Use code FREE50"),
                      _buildPromoCard(
                          "60% off on Debit Card", "No coupon required"),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {
                          // Cancel action
                          ref.read(selectedTimeProvider.notifier).state = null;
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {
                          // Book Now Action
                          if (selectedTime != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Consultation booked for ${selectedDate.toLocal().toShortString()} at $selectedTime",
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a time slot!")),
                            );
                          }
                        },
                        child: const Text("Book Now"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 16)),
              Expanded(child: Text(point)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPromoCard(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 15,
                    fontWeight: FontWeight.bold, color: AppColors.textColor)),
            const SizedBox(height: 1),
            Text(subtitle, style: const TextStyle( fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

extension DateExtension on DateTime {
  String toShortString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
