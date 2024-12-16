import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/feature/Booking/InPersonPop_Screen.dart';
// import 'package:styler/src/feature/Booking/booking_page.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/custom_text_buttom.dart';
import 'package:table_calendar/table_calendar.dart';

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
final selectedTimeProvider = StateProvider<String?>((ref) => null);

class InPersonConsultationScreen extends ConsumerWidget {
  const InPersonConsultationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedTime = ref.watch(selectedTimeProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'In-Person Consultation',
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold),
          ),
          leading: CustomBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Duration:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                    width:
                        8), // Adds a small space between the title and the text
                Text(
                  'Typically 45-60 Minutes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            _buildSectionTitle('Benefits:'),
            _buildBulletedList([
              'Face-to-face interaction for more personal and direct communication.',
              'Hands-on assistance and immediate feedback.',
              'Access to in-person tools, equipment, or physical products (if applicable).',
            ]),
            _buildSectionTitle('Ideal For:'),
            _buildBulletedList([
              'Those who prefer personal interaction and a more detailed, hands-on consultation.',
              'Clients looking for a more immersive experience or needing physical presence.',
            ]),
            _buildSection2Title('Schedules'),
           TableCalendar(
  firstDay: DateTime.utc(2022, 1, 1),
  lastDay: DateTime.utc(2030, 12, 31),
  focusedDay: selectedDate ?? DateTime.now(),
  selectedDayPredicate: (day) => isSameDay(selectedDate, day),
  onDaySelected: (selectedDay, focusedDay) {
    // Update the selected day in Riverpod state
    ref.read(selectedDateProvider.notifier).state = selectedDay;

    // Navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPopup(),
      ),
    );
  },
  calendarFormat: CalendarFormat.week,
  headerStyle: HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
  ),
  calendarStyle: const CalendarStyle(
    selectedDecoration: BoxDecoration(
      color: AppColors.primary,
      shape: BoxShape.rectangle,
    ),
    todayDecoration: BoxDecoration(
      color: Colors.grey,
      shape: BoxShape.rectangle,
    ),
  ),
),

            _buildSection2Title('Available Time'),
            Wrap(
              spacing: 10,
              children: ['1:00pm', '3:00pm', '5:00pm', '7:00pm']
                  .map((time) => ChoiceChip(
                        label: Text(time),
                        selected: selectedTime == time,
                        onSelected: (isSelected) {
                          ref.read(selectedTimeProvider.notifier).state =
                              isSelected ? time : null;
                        },
                      ))
                  .toList(),
            ),
            _buildSection2Title('Set the Location'),
            Card(
              child: Image.asset(
                'assets/images/san_francisco_map.png',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Try these services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ServiceItem(
                  imagePath: 'assets/images/service1.png',
                  label: 'Custom Design',
                ),
                ServiceItem(
                  imagePath: 'assets/images/service2.png',
                  label: 'Ready-to-Wear',
                ),
                ServiceItem(
                  imagePath: 'assets/images/service3.png',
                  label: 'Custom Design',
                ),
              ],
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(
                    text: "Cancel", width: 160, height: 50, onPressed: () {}),
                CustomTextButton(
                    text: " Book Now",
                    width: 160,
                    height: 50,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
    );
  }

  Widget _buildSection2Title(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor),
      ),
    );
  }

  Widget _buildBulletedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(fontSize: 18)),
                    Expanded(
                        child: Text(item,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildServiceCard(String title, String imagePath) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const ServiceItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 40,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
 