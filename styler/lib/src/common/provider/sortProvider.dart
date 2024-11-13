import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider<String?>((ref) => 'All');
final ratingProvider = StateProvider<String?>((ref) => 'All');
final priceRangeProvider = StateProvider<String?>((ref) => 'All');
final specialtyProvider = StateProvider<String?>((ref) => 'All');
final servicesProvider = StateProvider<String?>((ref) => 'All');
