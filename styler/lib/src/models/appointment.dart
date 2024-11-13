import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart'; 

class AppointmentReminderCard extends ConsumerWidget {
  const AppointmentReminderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentProvider);

    return SizedBox(
      width: 372,
      height: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 253,
                height: 19,
                child: Text(
                  'Appointment Reminder',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 91,
                height: 15,
                child: Text(
                  appointment.date, 
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF5A3F2C),
                    
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: 372,
            height: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF5A3F2C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    
                    Text(
                      appointment.title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
                Text(
                  appointment.time,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
