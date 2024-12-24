class Property {
  final String id; // Property ID
  final String name; // Property name
  final String location; // Property location
  final double price; // Property price
  final int bedrooms; // Number of bedrooms
  final int bathrooms; // Number of bathrooms
  final String imageUrl; // Image URL
  final double distance; // Distance from the user
  final String description; // Property description
  final String ownerName; // Owner's name

  Property({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
    required this.distance,
    required this.description,
    required this.ownerName,
  });
}
