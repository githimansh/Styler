import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return 
   SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Opening Hours'),
          OpeningHoursSection(),
          SizedBox(height: 16),
          SectionHeader(title: 'Meeting Price'),
          MeetingPriceSection(),
          SizedBox(height: 16),
          ContactInfoSection(phoneNumber: '9876543210'),
          SizedBox(height: 16),
          SectionHeader(title: 'Address'),
          AddressSection(address: '456 Oak Street, Cityville, CA 90210'),
          SizedBox(height: 16),
          SectionHeader(title: 'Reviews'),
          ReviewsSection(),
          const SizedBox(height: 16,),
          CustomButton(buttonText: "Get Directions - 4km",
          onPressed: () {

          },
          )
        ],
      
      ),
      
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }
}

class OpeningHoursSection extends StatelessWidget {
  const OpeningHoursSection({super.key});

  static const _labelStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xFF546879),
  );

  static const _valueStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: Color(0xFF075DAA),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoRow(
          label: 'Monday - Tuesday',
          value: '8:30 am - 9:30 pm',
          labelStyle: _labelStyle,
          valueStyle: _valueStyle,
        ),
        InfoRow(
          label: 'Saturday - Sunday',
          value: 'Closed',
          labelStyle: _labelStyle,
          valueStyle: _valueStyle.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

class MeetingPriceSection extends StatelessWidget {
  const MeetingPriceSection({super.key});

  static const _labelStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xFF546879),
  );

  static const _valueStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: Color(0xFF075DAA),
  );

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfoRow(
          label: 'Virtual Meeting',
          value: '\$100',
          labelStyle: _labelStyle,
          valueStyle: _valueStyle,
        ),
        InfoRow(
          label: 'In-Person Meeting',
          value: '\$200',
          labelStyle: _labelStyle,
          valueStyle: _valueStyle,
        ),
      ],
    );
  }
}

class ContactInfoSection extends StatelessWidget {
  final String phoneNumber;

  const ContactInfoSection({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Contact',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            phoneNumber,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              decoration: TextDecoration.underline,
              color: Color(0xFF075DAA),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressSection extends StatelessWidget {
  final String address;

  const AddressSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(address, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Center(
            child: Text(
              'Google Map Placeholder',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      ReviewModel(
        name: 'Sarah Shaoeb',
        daysAgo: '3 Days Ago',
        rating: 4,
        comment:
            'Great service and friendly staff! The experience was wonderful.',
      ),
      ReviewModel(
        name: 'John Doe',
        daysAgo: '5 Days Ago',
        rating: 5,
        comment: 'Highly recommend their service! Best in town.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          
        ),
        Column(
          children: reviews
              .map((review) => ReviewCard(review: review))
              .toList(),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/default_avatar.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        review.daysAgo,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF546879),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      if (index < review.rating.floor()) {
                        return const Icon(
                          Icons.star,
                          color: Color(0xFFFDD805),
                          size: 18,
                        );
                      } else if (index == review.rating.floor() &&
                          review.rating % 1 != 0) {
                        return const Icon(
                          Icons.star_half,
                          color: Color(0xFFFDD805),
                          size: 18,
                        );
                      } else {
                        return const Icon(
                          Icons.star_border,
                          color: Color(0xFFFDD805),
                          size: 18,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.comment,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: Color(0xFF546879),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey.shade300,
          size: 16,
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label, textAlign: TextAlign.center, style: labelStyle),
          ),
          const VerticalDivider(thickness: 1, color: Color(0xFFD1D1D1)),
          Expanded(
            child: Text(value, textAlign: TextAlign.center, style: valueStyle),
          ),
        ],
      ),
    );
  }
}

class ReviewModel {
  final String name;
  final String daysAgo;
  final int rating;
  final String comment;

  ReviewModel({
    required this.name,
    required this.daysAgo,
    required this.rating,
    required this.comment,
  });
}
