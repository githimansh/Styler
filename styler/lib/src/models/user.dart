
class User {
  final String name;
  final String location;
  final String imageUrl;

  User({
    required this.name,
    required this.location,
    this.imageUrl = 'https://via.placeholder.com/150', 
  });
}
