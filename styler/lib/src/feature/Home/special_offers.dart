import 'package:flutter/material.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';

class SpecialOfferPage extends StatefulWidget {
  const SpecialOfferPage({super.key});

  @override
  _SpecialOfferPageState createState() => _SpecialOfferPageState();
}
class _SpecialOfferPageState extends State<SpecialOfferPage> {  
  final List<String> _imagePaths = [
    'assets/images/specialOffer/offer2.png',
    'assets/images/specialOffer/offer3.png',
    'assets/images/specialOffer/offer4.png',
    'assets/images/specialOffer/offer5.png',
    'assets/images/specialOffer/offer1.png',
    'assets/images/specialOffer/offer2.png',
    'assets/images/specialOffer/offer3.png',
  ];
  Future<List<String>> fetchImages() async {
    await Future.delayed(Duration(seconds: 1)); 
    return _imagePaths; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Special Offers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: CustomBackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load images.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No offers available.'));
          }
          final images = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(images[index]),
              );
            },
          );
        },
      ),
    );
  }
}
