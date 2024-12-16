import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styler/src/feature/Profile/address_page.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/textfield.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _selectedPrefix;
  String? _selectedGender; // Corrected to store gender
  DateTime? _selectedDate;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  bool _isFormValid() {
    return _fullNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _selectedPrefix != null &&
        _selectedDate != null &&
        _selectedGender != null; // Check for gender validity
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Fill Your Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: AppColors.hintColor,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? const Icon(Icons.person, size: 60, color: Colors.grey)
                        : null,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.textColor,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: AppColors.background, size: 15),
                      onPressed: _showImageSourceDialog,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                prefixText: const Text('🇮🇳'),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  hintText: 'Prefix',
                  border: InputBorder.none,
                ),
                value: _selectedPrefix,
                items: ['Mr.', 'Ms.', 'Mrs.'].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.hintColor),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPrefix = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(controller: _fullNameController, hintText: 'Full Name'),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: TextEditingController(text: _selectedDate != null ? "${_selectedDate!.toLocal()}".split(' ')[0] : ''),
                hintText: _selectedDate != null ? "${_selectedDate!.toLocal()}".split(' ')[0] : 'DOB',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _selectDate,
                ),
                readOnly: true,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  border: InputBorder.none,
                ),
                value: _selectedGender,
                items: ['Male', 'Female', 'Other'].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.hintColor),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Continue',
                onPressed: _isFormValid()
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FillAddressScreen()),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
